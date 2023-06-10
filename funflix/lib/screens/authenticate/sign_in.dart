import 'package:flutter/material.dart';
import 'package:funflix/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: ElevatedButton(
            onPressed: () async {
              // dynamic access = await _auth.SignInWithEmailPassword();
              // if (!access) print('Error signing in');
              // else print("Successfully sign in as $access");
            },
            child: Text('SIGN IN'),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.orange)
            ),
          ),
        )
      ),
    );
  }
}
