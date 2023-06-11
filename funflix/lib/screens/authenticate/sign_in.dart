import 'package:flutter/material.dart';
import 'package:funflix/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function() toggleView;
  SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  void signInUser() async {
    if (_formKey.currentState!.validate()) {
      // Form validation successful, proceed with registration
      print("$email $password");
      // Call the AuthService method to register the user
    }
  }

  Widget buildForm(){
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              setState(() => email = value);
            },
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            validator: (value) {
              return null;
            },
          ),
          const SizedBox(height: 20.0),


          TextFormField(
            onChanged: (value) {
              setState(() => password = value);
            },
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            obscureText: true,
            validator: (value) {
              return null;
            },
          ),
          const SizedBox(height: 20.0),


          ElevatedButton(
            onPressed: signInUser,
            child: const Text("REGISTER"),
          ),
          const SizedBox(height: 20.0),


          TextButton(
            onPressed: (){
              widget.toggleView();
            },
            child: Text('Don\'t have an account? Register now.'),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return buildForm();
  }
}
