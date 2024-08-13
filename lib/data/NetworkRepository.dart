import 'package:search_images_flutter/api/ApiService.dart';

class NetworkRepository {
    ApiService service = ApiService();

    Future<List<String>> searchImages(String query, int page) async {
        dynamic response = await service.get(query, page.toString());
        final jsonData = response['results'] as List;
        List<String> imageList = 
            jsonData.map((e) => e.toString()).toList();

        return imageList;
    }
}