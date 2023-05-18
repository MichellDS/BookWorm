import 'package:flutter/material.dart';
import 'package:google_books_api/google_books_api.dart';

//ignore: prefer_const_constructors
//  List<Book> books = await GoogleBooksApi().searchBooks(
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
  void _SearchBook() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
                onPressed: _SearchBook,
                icon: Icon(Icons.search),
                label: Text('Pesquisar')),
            Scrollbar(
                child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Teste'),
                  onTap: () {},
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
