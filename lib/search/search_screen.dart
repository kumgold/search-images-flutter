import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_images_flutter/search/search_view_model.dart';

import '../db/DatabaseProvider.dart';
import '../db/model/LocalImage.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final databaseProvider = DatabaseProvider();

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
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              children: List.generate(viewModel.list.length, (index) {
                return InkWell(
                  onLongPress: () {
                    var image = viewModel.list[index];

                    databaseProvider.insertImage(
                        LocalImage(
                            id: DateTime.now().microsecond,
                            imageUrl: image.imageUrl,
                            docUrl: image.docUrl ?? "",
                            datetime: image.datetime ?? ""
                        )
                    );
                  },
                  child: Image.network(
                    viewModel.list[index].imageUrl,
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