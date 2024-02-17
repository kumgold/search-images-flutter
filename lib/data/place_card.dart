import 'package:flutter/material.dart';

@immutable
class PlaceCard {

  const PlaceCard({
    required this.image,
    required this.name,
    required this.rating,
    required this.description
  });

  final String image;
  final String name;
  final String rating;
  final String description;

  @override
  int get hashCode {
    return image.hashCode ^ name.hashCode ^ rating.hashCode ^ description.hashCode;
  }

  @override
  String toString() {
    return "PlaceSmall(name: '$name', rating: '$rating', description: '$description'";
  }

  @override
  bool operator ==(Object other) {
    return (other is PlaceCard &&
        other.name == name &&
        other.rating == rating &&
        other.image == image &&
        other.description == description
    );
  }
}