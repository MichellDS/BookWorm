import 'package:floor/floor.dart';

import '../models/mybooks.dart';

@dao
abstract class MyBooksDao {
  @Query('SELECT * FROM MyBooks')
  Future<List<MyBooks>> findAllBooks();

  @Query('SELECT title FROM MyBooks')
  Future<List<String>> findAllBooksTitles();

  @Query('SELECT authors FROM MyBooks')
  Future<List<String>> findAllBooksAuthors();

  @Query('SELECT categories FROM MyBooks')
  Future<List<String>> findAllBooksCategories();

  @Query('SELECT description FROM MyBooks')
  Future<List<String>> findAllBooksDescription();

  @Query('SELECT * FROM MyBooks WHERE id = :id')
  Future<MyBooks?> findAllBooksbyId(String id);

  @insert
  Future<void> insertBooks(MyBooks mybooks);

  @delete
  Future<void> deleteBooks(MyBooks myBooks);
}
