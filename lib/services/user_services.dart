import 'dart:convert';
import 'package:waste_product/models/users_model.dart';
import 'package:waste_product/utils/request_helper.dart';

class UserService {
  static Future<Users> getAllUsers() async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("user"),
      );
      return Users.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch UserService > getAllUsers$e");
      return null;
    }
  }

  static Future<void> getUserById(String userId) async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("user/$userId"),
      );
      // return Users.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch UserService > getAllUsers$e");
      // return null;
    }
  }
}
