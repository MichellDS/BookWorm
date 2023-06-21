import 'dart:async';
import 'package:bookworm/daos/books_dao.dart';
import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

import '../models/mybooks.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [MyBooks])
abstract class AppDatabase extends FloorDatabase {
  MyBooksDao get myBooksDao;
}
