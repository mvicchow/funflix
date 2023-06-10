import 'package:flutter/material.dart';
import 'package:funflix/screens/wrapper.dart';
// import 'package:funflix/pages/player.dart';
// import 'package:funflix/pages/register.dart';


void main() => runApp(
  MyApp(),
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Wrapper(),
    );
  }
}
