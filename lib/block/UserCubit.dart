import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/usermodel.dart';
import '../repository/counter_repository.dart';

class UserCubit extends Cubit<List<User>> {// <List<User> this is a type what Cubit file is return here
  // my Cubit file return a <List<User> this is a Model file
  // this is a Api file or repository file
  final UserRepository repository;
  // here we put our repository into the constructor
  UserCubit(this.repository) : super([]);// initial state here []

  Future<void> loadUsers() async {
    try {
      final users = await repository.fetchUsers();// here call a Api
      emit(users); // ✅ This now works correctly
      // here emit(users) add a response into the Cubit or to give response to a State
    } catch (e) {
      emit([]); // Or handle error state differently
    }
  }
}