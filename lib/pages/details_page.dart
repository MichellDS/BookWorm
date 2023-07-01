import 'package:bookworm/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:bookworm/models/mybooks.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bookworm/daos/database.dart';

class DetailsBook extends StatefulWidget {
  const DetailsBook({super.key, this.detabook});

  final MyBooks? detabook;

  @override
  State<DetailsBook> createState() => _DetailsBookState();
}

class _DetailsBookState extends State<DetailsBook> {
  bool salvar = false;
  // ignore: prefer_typing_uninitialized_variables
  late final db;

  @override
  void initState() {
    initDb();
    super.initState();
  }

  initDb() async {
    var dbTmp = await $FloorAppDatabase.databaseBuilder('bookworm.db').build();
    setState(() {
      db = dbTmp;
    });
    temID();
  }

  Future<bool?> temID() async {
    var resultBook = await db.myBooksDao.findAllBooksbyId(widget.detabook!.id!);
    setState(() {
      salvar = resultBook == null ? false : true;
    });
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 34),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      tooltip: AppLocalizations.of(context)!.msg_dpback,
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
                        size: 40,
                      ),
                    ),
                    GradientText(
                      AppLocalizations.of(context)!.msg_dpdetails,
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
                      message: AppLocalizations.of(context)!
                          .msg_dpsave, //AppLocalizations.of(context)!
                      triggerMode: TooltipTriggerMode.tap,
                      child: IconButton(
                        onPressed: () {
                          if (salvar == false) {
                            db.myBooksDao.insertBooks(widget.detabook!);
                          } else {
                            db.myBooksDao.deleteBooks(widget.detabook!);
                          }
                          setState(
                            () {
                              salvar = !salvar;
                            },
                          );
                        },
                        icon: Icon(
                          salvar ? Icons.bookmark : Icons.bookmark_outline,
                          size: 40,
                          color: const Color.fromARGB(255, 177, 1, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.all(60),
                color: const Color.fromARGB(193, 211, 243, 251),
                child: Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 30, top: 30, right: 30),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                widget.detabook!.cape!,
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
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.detabook!.title!,
                                  style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  widget.detabook!.subtitle!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  widget.detabook!.categories!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.msg_dpauthors,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.detabook!.authors!,
                                  style: const TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          right: 50, left: 50, bottom: 50),
                      alignment: Alignment.center,
                      child: Text(
                        widget.detabook!.description!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
