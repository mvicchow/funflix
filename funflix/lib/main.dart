import 'package:flutter/material.dart';
import 'package:funflix/pages/home.dart';
// import 'package:funflix/pages/player.dart';
// import 'package:funflix/pages/register.dart';


void main() => runApp(
  MaterialApp(
    theme: ThemeData.dark(),
    initialRoute: "/",
    routes: {
      '/' : (context) => Home(),
      // '/register' : (context) => RegisterPage(),
      // '/login' : (context) => MyPage(),
      // '/player' : (context) => Play(),
      // '/profile' : (context) => (),
      // '/search' : (context) => (),
      // '/home' : (context) => (),
    },
  ),
);
