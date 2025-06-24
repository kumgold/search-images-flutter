import 'package:flutter/material.dart';
import 'package:search_images_flutter/data/db/DatabaseProvider.dart';

import '../../data/db/model/LocalImage.dart';

class FavoriteViewModel with ChangeNotifier {
  final DatabaseProvider _provider = DatabaseProvider();

  List<LocalImage> images = [];
  bool isEditMode = false;
  String? userMessage;

  Future<void> getImages() async {
    images = await _provider.getImages();
    notifyListeners();
  }

  Future<void> deleteImage(List<int> checkList) async {
    for (int id in checkList) {
      await _provider.deleteImage(id);
    }

    notifyListeners();
  }

  void setEditMode() {
    isEditMode = !isEditMode;
    notifyListeners();
  }

  @override
  void dispose() {
    _provider.close();
    super.dispose();
  }
}
