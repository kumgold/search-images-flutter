import 'package:flutter/material.dart';
import 'package:search_images_flutter/db/DatabaseProvider.dart';

import '../db/model/LocalImage.dart';

class FavoriteViewModel with ChangeNotifier {
  DatabaseProvider _provider = DatabaseProvider();

  List<LocalImage> list = [];

  Future<void> getImages() async {
    list = await _provider.getImages();
    notifyListeners();
  }

  @override
  void dispose() {
    _provider.close();
    super.dispose();
  }
}