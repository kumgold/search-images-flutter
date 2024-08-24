import 'package:flutter/material.dart';
import 'package:search_images_flutter/db/DatabaseProvider.dart';

import '../db/model/LocalImage.dart';

class FavoriteViewModel with ChangeNotifier {
  final DatabaseProvider _provider = DatabaseProvider();

  List<LocalImage> images = [];
  bool isEditMode = false;
  String? userMessage;

  Future<void> getImages() async {
    images = await _provider.getImages();
    notifyListeners();
  }

  Future<void> deleteImage(int id) async {
    var result = await _provider.deleteImage(id);

    if (result) {
      userMessage = "Success to delete image!";
    } else {
      userMessage = "Failed to delete image!";
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