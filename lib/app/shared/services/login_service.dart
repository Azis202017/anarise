import 'dart:convert';

import 'package:anarise/app/constant/api_url.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginService {
  final storage = GetStorage();
  Future<bool> loginUser(
      {required String username, required String password}) async {
    try {
      Map<String, dynamic> body = {
        "username": username,
        "password": password,
      };
      final response = await http.post(Uri.parse("$apiUrl/login"), body: body);
      print(response.body);
      if (response.statusCode == 200) {
        storage.write('token', json.decode(response.body)['data']['token']);

        return true;
      }
      return false;
    } catch (e) {
      return throw Exception(e);
    }
  }
}
