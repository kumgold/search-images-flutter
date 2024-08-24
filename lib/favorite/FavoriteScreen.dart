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

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<FavoriteViewModel>(context);
    viewModel.getImages();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        actions: [
          TextButton(
            child: const Text("Edit"),
            onPressed: () {
              viewModel.setEditMode();
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
          Expanded(
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
                      Image.network(
                        image.imageUrl,
                        fit: BoxFit.cover,
                      ),
                      Visibility(
                        visible: viewModel.isEditMode,
                        child: Positioned(
                          right: 0,
                          child: Checkbox(
                            value: checkList.contains(index),
                            onChanged: (bool? isCheck) {
                              if (checkList.contains(index)) {
                                checkList.remove(index);
                              } else {
                                checkList.add(index);
                              }

                              setState(() {});
                            },
                          ),
                        ),
                      )
                    ],
                  );
                }),
              )
          )
        ],
      )
    );
  }
}