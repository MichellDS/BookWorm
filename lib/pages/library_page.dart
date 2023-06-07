import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.green[100],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.black,
              child: Center(
                child: Text('${index + 1}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
