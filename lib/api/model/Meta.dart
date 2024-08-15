class Meta {

  Meta({
    required this.totalCount,
    required this.pageableCount,
    required this.isEnd
  });

  int totalCount;
  int pageableCount;
  bool isEnd;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    totalCount: json["total_count"],
    pageableCount: json["pageable_count"],
    isEnd: json["is_end"]
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "pageable_count": pageableCount,
    "is_end": isEnd
  };

}