import 'dart:convert';

import 'package:project_islami/models/radio_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:project_islami/models/reciters_response_model.dart';

class ApiManager {
  static Future<RadioResponseModel> getRadioData() async {
    try {
      Uri uri = Uri.parse("https://mp3quran.net/api/v3/radios?language=ar");
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);

      return RadioResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw e;
    }
  }

  static Future<RecitersResponseModel> getRecitersData() async {
    try {
      Uri uri = Uri.parse("https://mp3quran.net/api/v3/reciters");
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);

      return RecitersResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw e;
    }
  }
}
