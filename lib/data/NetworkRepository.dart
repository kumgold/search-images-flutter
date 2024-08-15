import 'package:search_images_flutter/api/ApiService.dart';

import '../api/model/SearchResponse.dart';

class NetworkRepository {
    ApiService service = ApiService();

    Future<SearchResponse> searchImages(String query, int page) async {
        SearchResponse response = await service.get(query, page.toString());

        return response;
    }
}