import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginRepo {

  Future<String> login(String email, String password) async {
    var loginApi = "http://49.50.76.136/hrmsapis/api/hrmsLogin/hrmsLogin";

    final response = await http.post(
      Uri.parse(loginApi),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "sContactNo": email,
        "sPassword": password
      }),
    );

    print('Status Code: ${response.statusCode}');
    print('Raw Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      if (jsonList.isNotEmpty && jsonList[0]["Result"] == "1") {
        // here we return token
        return jsonList[0]["sToken"] ?? "No token";

      } else {
        // result !=1 then i return msg
        throw Exception(jsonList[0]["Msg"] ?? "Login failed");
      }
    } else {
      // here we written server error
      throw Exception("Server error: ${response.statusCode}");
    }
  }
}
