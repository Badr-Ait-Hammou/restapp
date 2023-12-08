import 'dart:convert';

import 'package:restapp/model/user.dart';
import 'package:http/http.dart' as http;
class UserRepository {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> jsonUsers = json.decode(response.body);

      List<User> users = jsonUsers.map((json) =>User.formJson(json)).toList();
      return users;
    } else {
      throw Exception('Erreur ');
    }
  }
}