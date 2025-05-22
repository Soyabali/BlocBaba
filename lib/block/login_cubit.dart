import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/login_repository.dart';
import 'login_state.dart';

// this is a bloc file with the help of Cubit class

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo repository;// Repository class
  LoginCubit(this.repository) : super(LoginInitial());// login is first loaded or Initial State
   // here login () function have a two parameter email and password it a depend of api and response
  Future<void> login(String email, String password) async {
    emit(LoginLoading());// login is in progress
    try {
      final token = await repository.login(email, password);// here i hit api with parameter and get a response
      emit(LoginSuccess(token));// login is Successful and you received a api response
      // here you should see carefully i am get a data token or all data be carefully
    } catch (e) {
      emit(LoginFailure(e.toString())); // login failed (wrong credentials, server error).
    }
  }
}
