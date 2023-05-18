// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bookworm/main.dart';

import 'package:google_books_api/google_books_api.dart';

void main() {
  test('search books', () async {
    final List<Book> books = await GoogleBooksApi().searchBooks(
      'a',
      maxResults: 20,
      printType: PrintType.books,
      orderBy: OrderBy.relevance,
    );
    expect(books.length, 20);
    print(books);
  });

  test('get book by id', () async {
    final Book book = await GoogleBooksApi().getBookById('H0taAAAAYAAJ');
    expect(book.volumeInfo.title,
        'A Study of Income and Expenditures in Sixty Colleges. Year 1953-54');
  });
}
