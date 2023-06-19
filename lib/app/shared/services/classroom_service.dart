import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../constant/api_url.dart';
import '../../data/model/class_model.dart';

class ClassroomService {
  Future<List<Classroom>> getAllListClassroom() async {
    try {
      Uri uri = Uri.parse('$apiUrl/class');
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        List? data =
            (json.decode(response.body) as Map<String, dynamic>)['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => Classroom.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}