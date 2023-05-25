import 'package:bookworm/models/books.dart';
import 'package:flutter/material.dart';
import 'package:google_books_api/google_books_api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  List<Book> books = [];

  // ignore: non_constant_identifier_names
  void _SearchBook() async {
    // ignore: avoid_print
    print(_controller.text);

    books = await GoogleBooksApi().searchBooks(
      _controller.text,
      maxResults: 10,
      printType: PrintType.books,
      orderBy: OrderBy.relevance,
    );

    setState(() {
      books = books;
    });
    // ignore: avoid_print
    print(books);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            // Container(
            //   height: 400,
            //   color: Colors.black,
            // ),
            Container(
              alignment: Alignment.center,
              width: 600,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Titulo dos Livrozs',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.black)),
                ),
                onEditingComplete: _SearchBook,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return Column();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
