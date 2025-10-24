import 'package:flutter/material.dart';
import 'package:spotify_prepa/common/config/theme/app_theme.dart';
import 'package:spotify_prepa/presentation/Splash/pages/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: SplashPage(),
      ),
    );
  }
}
