import 'package:flutter/material.dart';
import 'package:gaculator/modules/genshin/view/genshin_view/genshin_view.dart';
import 'package:gaculator/modules/genshin/view/splash_screen/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      title: "Gaculator",
      routes: {
        'genshin': (context) => const GenshinView(),
      },
    );
  }
}
