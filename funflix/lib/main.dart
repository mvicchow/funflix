import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:funflix/screens/wrapper.dart';
import 'package:funflix/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
    StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Wrapper(),
      ),
    );
  }
}
