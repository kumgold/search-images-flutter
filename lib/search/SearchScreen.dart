import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_images_flutter/search/SearchViewModel.dart';

import '../api/widget/SearchTextForm.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SearchViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
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
          Expanded(
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

                    if (viewModel.userMessage != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(viewModel.userMessage!))
                      );
                    }
                  },
                  child: Image.network(
                    viewModel.images[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                );
              }),
            )
          )
        ],
      ),
    );
  }
}