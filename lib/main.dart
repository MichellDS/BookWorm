import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'pages/main_page.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      windowButtonVisibility: true,
      center: true,
      size: Size(1024, 768),
      minimumSize: Size(1024, 768));
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.setMaximizable(false);
    await windowManager.setResizable(false);
    await windowManager.focus();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: const [
      //   S.delegate,
      // ],
      // supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'BookWorm',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainPage(),
    );
  }
}
