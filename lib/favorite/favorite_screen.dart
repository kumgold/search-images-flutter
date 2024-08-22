import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_images_flutter/favorite/favorite_view_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<FavoriteViewModel>(context);

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
                children: List.generate(viewModel.images.length, (index) {
                  return InkWell(
                    onLongPress: () {
                      var image = viewModel.images[index];
                      viewModel.deleteImage(image.id);

                      if (viewModel.userMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(viewModel.userMessage!))
                        );
                      }
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          viewModel.images[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 0,
                          child: Visibility(
                            visible: viewModel.isEditMode,
                            child: Checkbox(
                              value: false,
                              onChanged: (isCheck) {

                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              )
          )
        ],
      )
    );
  }
}