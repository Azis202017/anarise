import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constant/api_url.dart';
import '../../data/model/detail_materi_model.dart';

class DetailMateriService {
  Future<DetailMateriModel?> getDetailMateri({ String? id}) async {
    final storage = GetStorage();
    try {
      Uri uri = Uri.parse('$apiUrl/material/$id');
      // http.Response response = await http
      //     .get(uri, headers: {'Authorization': 'Bearer ${box.read('token')}'});

      http.Response response = await http.get(uri,
          headers: {'Authorization': 'Bearer ${storage.read('token')}'});
      if (response.statusCode == 200) {
        return DetailMateriModel.fromJson(json.decode(response.body)['data']);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
