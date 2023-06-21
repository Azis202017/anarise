import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constant/api_url.dart';
import '../../data/model/summary_model.dart';

class SummaryService {
  Future<List<SummaryModel>> summaryModel() async {
    try {
      Uri uri = Uri.parse(
          '$apiUrl/material-flipcard?material_id=2ae2d644-74cb-4f1c-8107-c43fd5b4ba46');
      http.Response response = await http.get(
        uri,
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OGQxYjAxMS01MDYyLTRkMDAtYWNjZS1jOTY4NjVhMzFjMTEiLCJqdGkiOiIzNTVjNTBlYTc0MzY0YTY4NTNhYzM4ZTkxNWU1YTA2ODY5MjNiZDkxOWZkMWQyYmY3MmNiNTc3NjQ2ZjUyODBhMzNhOTlmZDk2YmU0YWYxZCIsImlhdCI6MTY4NzEwNDc1OS4zNzc1NjUsIm5iZiI6MTY4NzEwNDc1OS4zNzc1NjcsImV4cCI6MTcxODcyNzE1OS4zNzE0OTMsInN1YiI6ImI5NDYxMTM3LTEwMjAtNDU5Mi05MWE3LTM4YzE4Zjk4ZDMwOCIsInNjb3BlcyI6W119.LzqSE7gD_sNrh3LU5qiwxvge27shv4U7fCMYoXg2BQGlm8UekWh_JIuKKYKdzAlRoCrc139YVMO498fXVsFrL-jLCJ7GZSE4YWxBDWKBXdqEcSpq07R3g78WT8nVoeyT1bMOpOvYtMu6a-xzBRnucfj0jt7TT5xOL1VcFaX27SPqgjFxLBgqIbsfUsw0O7SMlO0xKprO6A7nOFyNtehcBLLbAEzDkf1Qq6mLI95E7asvFawEJPvKh6rCJNMDJMUy8o2KhdRBt4qCPtJSw2ENn1l0rFC-EifQzxO2tc7OIYpyI06jEZCKoaVj3ns6HMYlK9iymfgoZ0L48shy38L6rMX4SHUuPB6MeNv1fb-gZmjUntf7FnvYpteIawz3DFOhI-W-FzRu8uJaxmOLA2fMMTSF-QatCYnv9rJ89bk8XEUrNQF0Doy5mIu7MUYxmJgaAJVUvRfNcMvTjCdDJVyfAvPALNdfQ0Dul6Ww6ilS0gnEsfIZ1e7La021cfoo7Z6aGJa383ijnV7BHv5xmO2h2Rhq4rZ9ECr-0e-m-oiCzHInqll2HC0HZkCDCws3nKtzrDQNpYeG9ob1ETjTzo0tCNoWY4GkEyXnbXM5Oj_J9b6MHutprlgWKc4h-iisjmednGVoQUHIZAbcO6gHwjgVgqorP_QZhGLm3XR92HaWh1Y',
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
