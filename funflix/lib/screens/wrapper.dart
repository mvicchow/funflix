import 'package:flutter/material.dart';
import 'package:funflix/screens/authenticate/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:funflix/screens/home/home.dart';
import 'package:funflix/screens/passcode/passcode.dart';
import 'package:funflix/services/user_database.dart';
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
    //  UserDataServices().getDocumentFieldValue('user', 'passcode');
      // UserDataServices().checkAndCreateDocument('user');
      // UserDataServices().checkAndCreateDocument('userWatches');
      // if (!UserDataServices().checkPasscodeCreated()){
      //   return PasscodeScreen(titleText: 'Create Passcode', mode: 0);
      // }
      return Home();
    }
  }
}
