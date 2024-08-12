import 'package:flutter/material.dart';
import 'package:search_images_flutter/data/NetworkRepository.dart';

class SearchViewModel with ChangeNotifier {
  Future<void> searchImages(String query, int page) async {
    try {
      List<String> imageList = await NetworkRepository().searchImages(query, page);

    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}