import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_images_flutter/api/widget/SearchTextForm.dart';
import 'package:search_images_flutter/favorite/FavoriteViewModel.dart';

import '../db/model/LocalImage.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  late FavoriteViewModel viewModel;

  List<int> checkList = [];
  String actionButtonText = "Edit";

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<FavoriteViewModel>(context);
    viewModel.getImages();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
        actions: [
          TextButton(
            child: Text(actionButtonText),
            onPressed: () {
              viewModel.setEditMode();

              if (viewModel.isEditMode) {
                actionButtonText = "Delete";
                checkList.clear();
              } else {
                actionButtonText = "Edit";
                viewModel.deleteImage(checkList);
              }

              setState(() {});
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          searchTextForm(
             (value) {
                //
             }
          ),
          const SizedBox(height: 16),
          imageGridWidget()
        ],
      )
    );
  }

  Widget imageGridWidget() {
    return Expanded(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: List.generate(viewModel.images.length, (index) {
            var image = viewModel.images[index];

            return Stack(
              fit: StackFit.expand,
              children: [
                InkWell(
                  child: Image.network(
                    image.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                checkImageWidget(image)
              ],
            );
          }),
        )
    );
  }

  Widget checkImageWidget(LocalImage image) {
    return Visibility(
      visible: viewModel.isEditMode,
      child: Positioned(
        right: 0,
        child: Checkbox(
          value: checkList.contains(image.id),
          onChanged: (bool? isCheck) {
            if (checkList.contains(image.id)) {
              checkList.remove(image.id);
            } else {
              checkList.add(image.id);
            }

            setState(() {});
          },
        ),
      ),
    );
  }
}