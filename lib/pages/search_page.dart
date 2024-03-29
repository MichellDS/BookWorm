import 'package:bookworm/models/mybooks.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:google_books_api/google_books_api.dart';
import 'package:bookworm/models/bookwidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    if (_controller.text == "") return;

    books = (await const GoogleBooksApi().searchBooks(
      _controller.text,
      maxResults: 30,
      printType: PrintType.books,
      orderBy: OrderBy.relevance,
    ));

    setState(() {
      books = books;
    });
    // ignore: avoid_print
    //print(books);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bookshelf.png'),
            fit: BoxFit.fitHeight,
            repeat: ImageRepeat.repeat,
            opacity: 0.4,
          ),
        ),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            GradientText(
              'BookWorm',
              style: TextStyle(
                fontSize: 80,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 5
                  ..color = Colors.blue[100]!,
              ),
              colors: const [
                Color.fromARGB(255, 147, 246, 89),
                Color.fromARGB(255, 0, 88, 239),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: 600,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  hintText: AppLocalizations.of(context)!.msg_sptitle,
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
                  Uri? imageLinks;
                  if (books[index].volumeInfo.imageLinks != null &&
                      books[index].volumeInfo.imageLinks!.isNotEmpty) {
                    imageLinks =
                        books[index].volumeInfo.imageLinks!.entries.first.value;
                  }

                  String cape;
                  cape = imageLinks.toString();

                  return BookWidget(
                    mybooks: MyBooks(
                      id: books[index].id,
                      title: books[index].volumeInfo.title,
                      subtitle: books[index].volumeInfo.subtitle,
                      cape: cape,
                      authors: books[index].volumeInfo.authors.join(', '),
                      categories: books[index].volumeInfo.categories.join(', '),
                      description: books[index].volumeInfo.description,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
