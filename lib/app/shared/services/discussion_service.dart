import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../constant/api_url.dart';
import '../../data/model/discussion_detail_model.dart';
import '../../data/model/discussion_model.dart';

class DiscussionService {
  Future<List<DiscussionModel>> fetchDiscussionData() async {
    final storage = GetStorage();
    try {
      Uri uri = Uri.parse('$apiUrl/discussion');
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
          return data.map((e) => DiscussionModel.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      return throw Exception(e);
    }
  }
  Future<DiscussionDetailModel?> fetchDiscussionDetail(String id) async {
    final storage = GetStorage();
    try {
      Uri uri = Uri.parse(
        '$apiUrl/discussion/$id',
      );
      http.Response response = await http.get(
        uri,
        headers: {
          'Authorization':
              'Bearer ${storage.read('token')}',
        },
      );
      if (response.statusCode == 200) {
        return DiscussionDetailModel.fromJson(
            (json.decode(response.body) as Map<String, dynamic>)['data']);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }
  Future<bool> postAnswerDiscussion({String? discussionId, String? title, String?content}) async {
    final storage = GetStorage();
    Map<String,String> headers = {
          'Authorization':
              'Bearer ${storage.read('token')}',
        };
    Map<String,dynamic> body = {
      'discussion_id': discussionId,
      'title' : title,
      'content': content
    };
    try {

      http.Response response = await http.post(
        Uri.parse('$apiUrl/reply-discussion'),
        headers: headers,
        body: body
      );
      print(response.body);
      if(response.statusCode == 200) {
        return true;
      }
      return false;
    }catch(e) {
      return throw Exception(e);
    }
  }
}
