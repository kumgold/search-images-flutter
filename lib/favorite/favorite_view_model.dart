import 'package:flutter/material.dart';
import 'package:search_images_flutter/db/DatabaseProvider.dart';

import '../db/model/LocalImage.dart';

class FavoriteViewModel with ChangeNotifier {
  List<LocalImage> list = [];

  Future<void> getImages() async {
    list = await DatabaseProvider().getImages();
    notifyListeners();
  }
}