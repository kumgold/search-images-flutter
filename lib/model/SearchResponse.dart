import 'SearchImage.dart';
import 'Meta.dart';

class SearchResponse {

  SearchResponse({
    required this.metadata,
    required this.images
  });

  Meta metadata;
  List<SearchImage> images;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    metadata: json["meta"],
    images: List<SearchImage>.from(json["documents"].map((x) => SearchImage.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "meta": metadata,
    "documents": List<dynamic>.from(images.map((x) => x.toJson()))
  };
}