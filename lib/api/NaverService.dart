import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class NaverService {
  final String _baseUrl = "dapi.kakao.com";

  Future<dynamic> get(String query, String page) async {
    dynamic responseJson;

    var searchImageUri = Uri(
        scheme: "https",
        host: _baseUrl,
        path: "/v2/search/image",
        queryParameters: {'query': query, 'page': page}
    );

    try {
      final response = await http.get(searchImageUri);
      responseJson = returnResponse(response);
    } catch (e) {
      print(e);
    }

    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200: {
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      }
      default: {
        throw Exception(response.body.toString());
      }
    }
  }
}