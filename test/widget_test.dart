// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:google_books_api/google_books_api.dart';

void main() {
  test('Procura livros pela API', () async {
    final List<Book> books = await const GoogleBooksApi().searchBooks(
      'casa',
      maxResults: 10,
      printType: PrintType.books,
      orderBy: OrderBy.relevance,
    );
    expect(books.length, 10);
    // ignore: avoid_print
    print(books);
  });

  test('get book by id', () async {
    final Book book = await const GoogleBooksApi().getBookById('UKTJDwAAQBAJ');
    expect(book.volumeInfo.title, 'Flutter na prática');
  });
}
