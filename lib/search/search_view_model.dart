import 'package:flutter/material.dart';
import 'package:search_images_flutter/data/NetworkRepository.dart';
import 'package:search_images_flutter/db/DatabaseProvider.dart';
import 'package:search_images_flutter/db/model/LocalImage.dart';

import '../api/model/SearchImage.dart';
import '../api/model/SearchResponse.dart';

class SearchViewModel with ChangeNotifier {
  List<SearchImage> list = [];

  Future<void> searchImages(String query, int page) async {
    try {
      SearchResponse result = await NetworkRepository().searchImages(query, page);
      list = result.images;
      print(result.images);
    } catch (e) {
      print("Search ViewModel Error = $e");
    }
    notifyListeners();
  }

  Future<void> insertImage(SearchImage image) async {
    DatabaseProvider().insertImage(
      LocalImage(
          id: DateTime.now().microsecond,
          imageUrl: image.imageUrl,
          docUrl: image.docUrl ?? "",
          datetime: image.datetime ?? ""
      )
    );
  }
}