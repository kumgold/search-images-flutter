import 'package:flutter/material.dart';

Widget searchTextForm(
  void Function(String) onSearch
) {
  return Container(
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
          onSearch(value);
      },
    ),
  );
}