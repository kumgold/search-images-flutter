import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_images_flutter/search/SearchViewModel.dart';

import '../api/widget/SearchTextForm.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  late SearchViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<SearchViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          searchTextForm(
            (value) {
              viewModel.searchImages(value, 1);
            }
          ),
          const SizedBox(height: 16),
          gridImageWidget()
        ],
      ),
    );
  }

  Widget gridImageWidget() {
    return Expanded(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: List.generate(viewModel.images.length, (index) {
            return InkWell(
              onLongPress: () {
                var image = viewModel.images[index];
                viewModel.insertImage(image);
              },
              child: Image.network(
                viewModel.images[index].imageUrl,
                fit: BoxFit.cover,
              ),
            );
          }),
        )
    );
  }
}