import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/login_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo repository;
  LoginCubit(this.repository) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final token = await repository.login(email, password);
      emit(LoginSuccess(token));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
