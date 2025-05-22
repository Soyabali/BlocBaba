import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/usermodel.dart';


class UserRepository { // this is my Api call file

  Future<List<User>> fetchUsers() async {

    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> userList = jsonData['data'];

      return userList.map((json) => User.fromJson(json)).toList(); // here we put our api response  into the model such as  User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}