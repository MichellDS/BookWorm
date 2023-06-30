import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'pages/main_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
<<<<<<< HEAD
      // localizationsDelegates: [
      //   S.delegate,
      // ],
      // 
=======
      // localizationsDelegates: const [
      //   S.delegate,
      // ],
      // supportedLocales: S.delegate.supportedLocales,
>>>>>>> 9dd3a4772b5ff9337e4a8a2f7997e5fe5f852405
      debugShowCheckedModeBanner: false,
      title: 'BookWorm',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainPage(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales

    );
  }
}
