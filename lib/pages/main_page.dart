import 'package:bookworm/pages/library_page.dart';
import 'package:bookworm/pages/search_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;
  final List<Widget> _pages = const [SearchPage(), LibraryPage()];

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BookWorm"),
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        backgroundColor: Colors.blue,
        fixedColor: Colors.white,
        iconSize: 30,
        currentIndex: _currentPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Library',
          )
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
