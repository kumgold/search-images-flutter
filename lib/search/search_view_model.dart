import 'package:flutter/material.dart';
import 'package:search_images_flutter/data/NetworkRepository.dart';

class SearchViewModel with ChangeNotifier {
  var list = [];


  Future<void> searchImages(String query, int page) async {
    try {
      List<String> imageList = await NetworkRepository().searchImages(query, page);
      print(imageList);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}