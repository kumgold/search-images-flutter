import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_images_flutter/favorite/favorite_view_model.dart';

import '../db/DatabaseProvider.dart';
import '../db/model/LocalImage.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final databaseProvider = DatabaseProvider();

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<FavoriteViewModel>(context);

    List<LocalImage> images = [];

    getImages().then((value) => images = value);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1, color: Colors.black)
            ),
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {

              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: List.generate(images.length, (index) {
                  return Image.network(
                    images[index].imageUrl,
                    fit: BoxFit.cover,
                  );
                }),
              )
          )
        ],
      )
    );
  }

  Future<List<LocalImage>> getImages() async {
    var list = await databaseProvider.getImages();

    return list;
  }
}