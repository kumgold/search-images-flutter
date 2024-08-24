import 'package:flutter/material.dart';
import 'package:search_images_flutter/data/NetworkRepository.dart';
import 'package:search_images_flutter/db/DatabaseProvider.dart';
import 'package:search_images_flutter/db/model/LocalImage.dart';

import '../api/model/SearchImage.dart';
import '../api/model/SearchResponse.dart';

class SearchViewModel with ChangeNotifier {
  final DatabaseProvider _provider = DatabaseProvider();

  List<SearchImage> images = [];
  String? userMessage;

  Future<void> searchImages(String query, int page) async {
    try {
      SearchResponse result = await NetworkRepository().searchImages(query, page);
      images = result.images;
    } catch (e) {
      print("Search ViewModel Error = $e");
    }
    notifyListeners();
  }

  Future<void> insertImage(SearchImage image) async {
    var result = await _provider.insertImage(
      LocalImage(
          id: DateTime.now().microsecond,
          imageUrl: image.imageUrl,
          docUrl: image.docUrl ?? "",
          datetime: image.datetime ?? ""
      )
    );

    if (result) {
      userMessage = "Success to insert image!";
    } else {
      userMessage = "Failed to insert image!";
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _provider.close();
    super.dispose();
  }
}