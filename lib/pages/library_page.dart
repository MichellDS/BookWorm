import 'package:bookworm/models/mybooks.dart';
import 'package:bookworm/pages/details_page.dart';
import 'package:flutter/material.dart';

import '../daos/database.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  Future<List<MyBooks>> loadBooks() async {
    var db = await $FloorAppDatabase.databaseBuilder('bookworm.db').build();
    return await db.myBooksDao.findAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          color: const Color.fromARGB(255, 171, 202, 255),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<List<MyBooks>>(
            future: loadBooks(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //print(snapshot.data!);
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                  ),
                  itemCount: snapshot.data!.length, //length
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsBook(
                                detabook: MyBooks(
                                    id: '',
                                    title: snapshot.data![index].title,
                                    subtitle: '',
                                    cape: '',
                                    authors: '',
                                    categories: '',
                                    description: ''),
                              ),
                            ),
                          );
                        },
                        title: Card(
                          color: Colors.blueGrey,
                          child: Center(
                            child: Text('${index + 1}'),
                          ),
                        )

                        // color: Colors.black,
                        // child: Center(
                        //   child: Text('${index + 1}'),
                        // ),
                        );
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          )

          //  GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 6,
          //   ),
          //   itemCount: , //length
          //   scrollDirection: Axis.vertical,
          //   itemBuilder: (_, index) {
          //     return ListTile(
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => DetailsBook(
          //                 detalhebook: MyBooks(
          //                     id: '',
          //                     title: '',
          //                     subtitle: '',
          //                     cape: '',
          //                     authors: '',
          //                     categories: '',
          //                     description: ''),
          //               ),
          //             ),
          //           );
          //         },
          //         title: Card(
          //           color: Colors.blueGrey,
          //           child: Center(
          //             child: Text('${index + 1}'),
          //           ),
          //         )

          //         // color: Colors.black,
          //         // child: Center(
          //         //   child: Text('${index + 1}'),
          //         // ),
          //         );
          //   },
          // ),
          ),
    );
  }
}
