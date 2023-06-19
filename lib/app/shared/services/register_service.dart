import 'package:http/http.dart' as http;

import '../../constant/api_url.dart';

class RegisterServices {
  Future<bool> register({
    String? fullName,
    String? classId,
    String? classroomName,
    String? username,
    String? password,
    String? passwordConfirmation,
  }) async {
    try {
      Uri uri = Uri.parse('$apiUrl/register');
      Map<String, dynamic> body = {
        'fullname': fullName,
        'class_id': classId,
        'username': username,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'role': "student".toLowerCase()
      };
      http.Response response = await http.post(uri, body: body);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}