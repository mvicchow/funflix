import 'package:flutter/material.dart';
import 'package:funflix/screens/authenticate/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:funflix/screens/home/home.dart';
import 'package:provider/provider.dart';

//wrapper is a page to dynamically access authentication or the app.
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      // ignore: prefer_const_constructors
      return Authenticate();
    } else {
      // ignore: prefer_const_constructors
      return Home();
    }
  }
}
