import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/usermodel.dart';
import '../repository/counter_repository.dart';

class UserCubit extends Cubit<List<User>> {

  final UserRepository repository;

  UserCubit(this.repository) : super([]);

  Future<void> loadUsers() async {
    try {
      final users = await repository.fetchUsers();
      emit(users); // ✅ This now works correctly
    } catch (e) {
      emit([]); // Or handle error state differently
    }
  }
}