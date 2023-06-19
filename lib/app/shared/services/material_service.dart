import 'dart:convert';

import 'package:anarise/app/data/model/material_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constant/api_url.dart';


class MaterialService {
  Future<List<MaterialModel>> getAllMaterial() async {
    
    try {
      final storage = GetStorage();
      Uri uri = Uri.parse('$apiUrl/material');
      http.Response response = await http.get(
        uri,
        headers: {
          'Authorization':
              'Bearer ${storage.read('token')}',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        List? data =
            (json.decode(response.body) as Map<String, dynamic>)['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => MaterialModel.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}