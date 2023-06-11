import 'package:flutter/material.dart';
import 'package:funflix/models/logo.dart';
import 'package:funflix/services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String confirmPassword = "";

  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      // Form validation successful, proceed with registration
      print("$email $password $confirmPassword");
      // Call the AuthService method to register the user
    }
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Logo(fontsize: 45),
                SizedBox(width: 8.0),
                Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            onChanged: (value) {
              setState(() => email = value);
            },
            validator: (value) {
              // Add validation logic for email field
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            obscureText: true,
            onChanged: (value) {
              setState(() => password = value);
            },
            validator: (value) {
              // Add validation logic for password field
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            obscureText: true,
            onChanged: (value) {
              setState(() => confirmPassword = value);
            },
            validator: (value) {
              // Add validation logic for confirm password field
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _registerUser,
            child: const Text("REGISTER"),
          ),
          const SizedBox(height: 20.0),
          TextButton(
            onPressed: (){},
            child: Text('Hello world'),

          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: _buildForm(),
        ),
      ),
    );
  }
}
