import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constant/api_url.dart';
import '../../data/model/quiz_detail_model.dart';
class QuizDetailService {
   Future<QuizDetailModel?> fetchQuestion({String? id}) async {
    final storage = GetStorage();
    try {
      Uri uri = Uri.parse(
        '$apiUrl/quiz/$id',
      );
      http.Response response = await http.get(
        uri,
        headers: {
          'Authorization':
              'Bearer ${storage.read('token')}',
        },
      );
      if (response.statusCode == 200) {
        return QuizDetailModel.fromJson(
            (json.decode(response.body) as Map<String, dynamic>)['data']);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

}