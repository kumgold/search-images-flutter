class LocalImage {
  int id;
  String imageUrl;
  String docUrl;
  String datetime;

  LocalImage({
    required this.id,
    required this.imageUrl,
    required this.docUrl,
    required this.datetime
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "imageUrl": imageUrl,
      "docUrl": docUrl,
      "datetime": datetime
    };
  }
}