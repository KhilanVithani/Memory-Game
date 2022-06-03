import 'package:flutter/material.dart';
import 'package:memorygame/Home_page.dart';
import 'package:memorygame/game/game.dart';
import 'package:memorygame/info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memory Game',
      home: HomePage(),
      routes: {
        'home': (context) => HomePage(),
        'game': (context) => Game(),
        'info': (context) => InfoPage(),
      },
    );
  }
}
