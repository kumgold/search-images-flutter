class SearchImage {

  SearchImage({
    required this.collection,
    required this.thumbnailUrl,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.displaySitename,
    this.docUrl,
    this.datetime
  });

  String collection;
  String thumbnailUrl;
  String imageUrl;
  int width;
  int height;
  String? displaySitename;
  String? docUrl;
  String? datetime;

  factory SearchImage.fromJson(Map<String, dynamic> json) => SearchImage(
      collection: json["collection"],
      thumbnailUrl: json["thumbnail_url"],
      imageUrl: json["image_url"],
      width: json["width"],
      height: json["height"],
      displaySitename: json["display_sitename"],
      docUrl: json["doc_url"],
      datetime: json["datetime"]
  );

  Map<String, dynamic> toJson() => {
    "collection": collection,
    "thumbnail_url": thumbnailUrl,
    "image_url": imageUrl,
    "width": width,
    "height": height,
    "display_sitename": displaySitename,
    "doc_url": docUrl,
    "datetime": datetime
  };
}