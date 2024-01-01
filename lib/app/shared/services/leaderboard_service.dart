import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../constant/api_url.dart';
import '../../data/model/leaderboard_model.dart';

class LeaderboardService {
  Future<List<Leaderboard>> fetchLeaderboardData({String? type, String? id}) async {
    final storage = GetStorage();
    try {
      Uri uri = Uri.parse('$apiUrl/leaderboard?type=$type&material_id=$id');
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
          return data.map((e) => Leaderboard.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      return throw Exception(e);
    }
  }
}