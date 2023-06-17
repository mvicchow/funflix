import 'package:flutter/material.dart';
import 'package:funflix/models/logo.dart';
import 'package:funflix/screens/authenticate/register.dart';
import 'package:funflix/screens/authenticate/sign_in.dart';
import 'package:funflix/widgets/loading.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();

}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = false;

  Future<void> toggleView() async {
    await Future.delayed(const Duration(seconds: 1), () => const Loading(),);
    setState(() {
      showSignIn = !showSignIn;
    });
  }


  Widget header(){
    return Column(
      children: [
        const Logo(fontsize: 45),
        const SizedBox(width: 8.0),
        Text(
          showSignIn ? 'SIGN IN' : 'REGISTER',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40,),
              header(),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: showSignIn ? SignIn(toggleView: toggleView,) : Register(toggleView: toggleView,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
