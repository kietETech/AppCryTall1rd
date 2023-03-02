import 'dart:convert';
import 'package:app_crytall_1rd/model/get_api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static String url = 'https://jsonplaceholder.typicode.com/posts';
  static List<GetAPI> parePost(String responseBody) {
    var list = json.decoder as List<dynamic>;
    List<GetAPI> getApi = list.map((model) => GetAPI.fromJson(model)).toList();
    return getApi;
  }

  static Future<List<GetAPI>> fetchData({int page = 1}) async {
    final response = await http.get(url as Uri);
    if (response.statusCode == 200) {
      return compute(parePost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception("Can't get post");
    }
  }
}
