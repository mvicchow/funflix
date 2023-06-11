import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:funflix/screens/wrapper.dart';
import 'package:flutter/src/widgets/binding.dart';


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
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Wrapper(),
    );
  }
}
