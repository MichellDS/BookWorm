extension Str on List<dynamic> {
  List<String> toStringList() {
    final l = <String>[];
    for (var i in this) {
      l.add(i.toString());
    }
    return l;
  }
}

class BookInfo {
  final String title;
  final String subtitle;
  final List<String> authors;
  final String description;
  final List<String> categories;
  final Map<String, Uri> imageLinks;

  const BookInfo({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.categories,
    required this.description,
    required this.imageLinks,
  });

  static BookInfo fromJson(
    Map<String, dynamic> json, {
    bool reschemeImageLinks = false,
  }) {
    final imageLinks = <String, Uri>{};
    (json['imageLinks'] as Map<String, dynamic>?)?.forEach((key, value) {
      Uri uri = Uri.parse(value.toString());
      if (reschemeImageLinks) {
        if (uri.isScheme('HTTP')) {
          uri = Uri.parse(value.toString().replaceAll('http://', 'https://'));
        }
      }
      imageLinks.addAll({key: uri});
    });

    return BookInfo(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      authors: ((json['authors'] as List<dynamic>?) ?? []).toStringList(),
      categories: ((json['categories'] as List<dynamic>?) ?? []).toStringList(),
      description: json['description'] ?? '',
      imageLinks: imageLinks,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'categories': categories,
      'description': description,
      'imageLinks': imageLinks,
    };
  }

  @override
  String toString() {
    return 'BookInfo(title: $title, subtitle: $subtitle authors: $authors, description: $description, categories: $categories, imageLinks: $imageLinks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookInfo &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.authors == authors &&
        other.description == description &&
        other.categories == categories &&
        other.imageLinks == imageLinks;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subtitle.hashCode ^
        authors.hashCode ^
        description.hashCode ^
        categories.hashCode ^
        imageLinks.hashCode;
  }
}
