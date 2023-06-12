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
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [

              // EMAIL FIELD
              SizedBox(
                height: 100.0,
                child:
                TextFormField(
                  initialValue: "",
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (String? value) {
                    if (value != null && value.isEmpty){
                      return "Email can't be empty";
                    }

                    return null;
                  },
                ),
              ),

              SizedBox(
                height: 100.0,
                child:
                TextFormField(
                  initialValue: "",
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  obscureText: true,
                  validator: (String? value) {
                    if (value != null && value.isEmpty){
                      return "Password can't be empty";
                    }
                    return null;
                  },
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    //SIGN IN
                  }
                },
                child: const Text("REGISTER"),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
        TextButton(
          onPressed: (){
            widget.toggleView();
          },
          child: Text('Don\'t have an account? Register now.'),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return buildForm();
  }
}
