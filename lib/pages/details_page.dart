import 'package:bookworm/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DetailsBook extends StatefulWidget {
  const DetailsBook({super.key});

  @override
  State<DetailsBook> createState() => _DetailsBookState();
}

class _DetailsBookState extends State<DetailsBook> {
  bool salvar = false;

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 34),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    tooltip: 'Voltar',
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  GradientText(
                    'Detalhes',
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
                  Tooltip(
                    message: 'Adicionar Livro',
                    triggerMode: TooltipTriggerMode.tap,
                    child: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            salvar = !salvar;
                          },
                        );
                      },
                      icon: Icon(
                        salvar ? Icons.bookmark : Icons.bookmark_outline,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 30,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://i.pinimg.com/564x/6d/e7/a7/6de7a770ff977eaef89ae40744447bba.jpg',
                    width: 110,
                    height: 140,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.image_not_supported,
                        size: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
