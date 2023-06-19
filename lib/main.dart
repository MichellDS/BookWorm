import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'pages/main_page.dart';



void main() {
  WindowOptions windowOptions = WindowOptions(
      windowButtonVisibility: true,
      center: true,
      size: Size(850, 600),
      minimumSize: Size(850, 600));
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'BookWorm',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainPage(),
    );
  }
}
