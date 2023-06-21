import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'daos/database.dart';
import 'pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    windowButtonVisibility: true,
    center: true,
    size: Size(1024, 768),
    minimumSize: Size(850, 600),
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.setMaximizable(false);
    await windowManager.focus();
  });

  final callback = Callback(
    onCreate: (database, version) {
      // inserts padrões
      database.execute("");
    },
  );

  final database = await $FloorAppDatabase
      .databaseBuilder('bookworm.db')
      .addCallback(callback)
      .build();

  database.close;

  runApp(const BookWormApp());
}

class BookWormApp extends StatelessWidget {
  const BookWormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookWorm',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainPage(),
    );
  }
}
