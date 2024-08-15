import 'package:flutter/material.dart';
import 'package:search_images_flutter/data/NetworkRepository.dart';
import 'package:search_images_flutter/model/SearchResponse.dart';

class SearchViewModel with ChangeNotifier {
  var list = [];


  Future<void> searchImages(String query, int page) async {
    try {
      SearchResponse result = await NetworkRepository().searchImages(query, page);
      print(result.images);
    } catch (e) {
      print("Search ViewModel Error = $e");
    }
    notifyListeners();
  }
}