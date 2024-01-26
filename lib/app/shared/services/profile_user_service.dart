import 'dart:convert';

import 'package:anarise/app/data/model/profile_user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constant/api_url.dart';

class ProfileUserService {
  Future<ProfileUserModel?> getUserData() async {
    final storage = GetStorage();
    try {
      Uri uri = Uri.parse('$apiUrl/profile');
     

      http.Response response = await http.get(uri,
          headers: {'Authorization': 'Bearer ${storage.read('token')}'});
      return ProfileUserModel.fromJson(json.decode(response.body)['data']);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> logoutUser() async {
    final storage = GetStorage();
    try {
      Uri uri = Uri.parse('$apiUrl/logout');
      http.Response response = await http.post(uri,
          headers: {'Authorization': 'Bearer ${storage.read('token')}'});
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> changePassword(
      {String? oldPassword, String? newPassword}) async {
    final storage = GetStorage();
    try {
      Uri uri = Uri.parse('$apiUrl/change-password');
      Map<String, dynamic> body = {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      };
      http.Response response = await http.put(
        uri,
        body: body,
        headers: {'Authorization': 'Bearer ${storage.read('token')}'},
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return throw Exception(e);
    }
  }
}
