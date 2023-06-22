import 'package:floor/floor.dart';

@entity
class MyBooks {
  @PrimaryKey(autoGenerate: false)
  String? id;
  String? title;
  String? subtitle;
  String? cape;
  String? authors;
  String? categories;
  String? description;

  MyBooks({
    this.id,
    this.title,
    this.subtitle,
    this.cape,
    this.authors,
    this.categories,
    this.description,
  });
}
