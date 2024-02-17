import 'package:flutter/material.dart';
import 'package:matzip/data/place_card.dart';

class HomeProvider extends ChangeNotifier {
  var recommendList = [
    const PlaceCard(image: '', name: 'name', rating: 'rating', description: 'description'),
    const PlaceCard(image: '', name: 'name', rating: 'rating', description: 'description'),
    const PlaceCard(image: '', name: 'name', rating: 'rating', description: 'description'),
    const PlaceCard(image: '', name: 'name', rating: 'rating', description: 'description')
  ];
}