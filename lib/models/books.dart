class Books {
  int? id;
  String? title;
  String? subtitle;
  List<String>? authors;
  List<String>? categories;
  Map<String, Uri>? capeImage;
  String? description;

  Books(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.authors,
      required this.categories,
      required this.capeImage,
      required this.description});

  String? get bookTitle {
    return this.title;
  }
}
