import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_images_flutter/search/search_view_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  // var list = Provider.of<SearchViewModel>(context).searchImages("query", 1);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SearchViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
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
                viewModel.searchImages(value, 1);
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(viewModel.list.length, (index) {
                return Image.network(
                  viewModel.list[index].imageUrl
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}