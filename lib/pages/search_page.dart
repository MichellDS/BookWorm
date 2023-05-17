import 'package:flutter/material.dart';
import 'package:google_books_api/google_books_api.dart';

// ignore: prefer_const_constructors
// final List<Book> books = await GoogleBooksApi().searchBooks(
//     'book',
//     maxResults: 20,
//     printType: PrintType.books,
//     orderBy: OrderBy.relevance,
// );

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView(
          children: [
            TextField(),
            SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.search_outlined),
                label: Text('Pesquisar'))
          ],
        ),
      ),
    );
  }
}
