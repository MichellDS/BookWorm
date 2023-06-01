library google_books;

import 'package:bookworm/models/bookWidget.dart';
//import 'package:bookworm/src/finder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:google_books_api/google_books_api.dart';

export 'package:bookworm/src/finder.dart';

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
      maxResults: 1,
      printType: PrintType.books,
      orderBy: OrderBy.relevance,
    ));

    setState(() {
      books = books;
    });
    // ignore: avoid_print
    print(books);
  }

  // ignore: non_constant_identifier_names
  // void _SearchBook() async {
  //   if (kDebugMode) {
  //     print(_controller.text);
  //   }

  //   book = await queryBooks(
  //     _controller.text,
  //     maxResults: 1,
  //     printType: PrintType.all,
  //     orderBy: OrderBy.relevance,
  //   );
  //   setState(() {
  //     book = book;
  //   });
  //   // ignore: avoid_print
  //   print(book);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bookshelf.png'),
            fit: BoxFit.fitHeight,
            repeat: ImageRepeat.repeat,
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
                Colors.white,
                Colors.blueAccent,
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
                  hintText: 'Titulo dos Livros',
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
                  return BookWidget(
                    title: books[index].volumeInfo.title, //'Solo leveling',
                    subtitle: books[index].volumeInfo.subtitle,
                    cape:
                        '', //'https://i.pinimg.com/originals/d2/20/be/d220bed248df7e9c238196e5b944e3e4.jpg',
                    authors: 'Chugong',
                    categories: 'Manga',
                    description:
                        'Um grande fenômeno um dia aconteceu, portais desconhecidos surgiram ligando o mundo que conhecemos a uma realidade totalmente extraordinária de monstros e seres fantasiosos, cujo único objetivo era matar humanos. Em resposta a esse novo perigo, surgiram os “Caçadores”, humanos que foram “despertados” e ganharam poderes capazes de bater de frente com essas criaturas. Dentre eles, há um conhecido por ser “a pior arma da humanidade”, Sung Jin-woo. Mas sua sorte irá mudar quando uma incursão que deveria ser fácil se torna um verdadeiro pesadelo.',
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
