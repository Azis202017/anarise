import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constant/api_url.dart';
import '../../data/model/summary_model.dart';

class SummaryService {
  Future<List<SummaryModel>> summaryModel({String? id}) async {
    final storage = GetStorage();
    try {
      Uri uri = Uri.parse(
          '$apiUrl/material-flipcard?material_id=$id');
      http.Response response = await http.get(
        uri,
        headers: {
          'Authorization':
              'Bearer ${storage.read('token')}',
        },
      );
      if (response.statusCode == 200) {
        List? data =
            (json.decode(response.body) as Map<String, dynamic>)['data'];

        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => SummaryModel.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
