import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funflix/screens/passcode/passcode.dart';
import 'package:funflix/services/auth.dart';
import 'package:funflix/services/user_database.dart';
import 'package:funflix/widgets/loading.dart';

class Register extends StatefulWidget {
  final Function() toggleView;
  const Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String confirmPassword = "";
  String errorMsg = "";
  bool loading = false;


  void registerUser(email, password) async {
    if(_formKey.currentState!.validate()){
      setState(() {
        loading = true;
      });
      dynamic result = await _auth.signUpUser(email, password);
      if(result == null){
        setState(() {
          errorMsg = "Account with this email is already exists!";
          loading = false;
        });
      }
    }
  }

  Widget buildToggleView(){
    return TextButton(
      onPressed: () async {
        setState(() {
          loading = true;
        });
        await widget.toggleView();
        try {
          setState(() {
            loading = false;
          });
        } catch (e) {
          // print(e.toString());
        }
      },
      child:
      Text('Already have an account? Log in here',
        style: TextStyle(
          color: Colors.orange[400]
        )
      )
    );
  }

  Widget buildForm() {
    if (loading){
      return const Loading();
    } else {
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
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),

                    validator: (String? value) {
                      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
                      if(value==null){
                        return "Invalid email";
                      }
                      if (value.isEmpty){
                        return "Email can't be empty";
                      }
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    }
                  ),
                ),


                // PASSWORD FIELD
                SizedBox(
                  height: 100.0,
                  child:
                  TextFormField(
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
                      if (value == null){
                        return "invalid password";
                      }
                      if (value.isEmpty){
                        return "Password can't be empty";
                      }
                      if (value.length < 8){
                        return "Password length must be equals or more than 8 characters";
                      }

                      return null;
                    },
                  ),
                ),

                SizedBox(
                  height: 100.0,
                  child:
                  TextFormField(
                    onChanged: (value) {
                      setState(() => confirmPassword = value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    obscureText: true,
                    validator: (String? value) {
                      if (value == null){
                        return "Invalid password";
                      }
                      if ( value.isEmpty){
                        return "Confirm Password can't be empty";
                      }
                      if (value != password){
                        return "Confirm Password & Password doesn't match ";
                      }

                      return null;
                    },
                  ),
                ),


                SizedBox(
                  height: 25,
                  child: Text(
                    errorMsg,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14
                    ),
                  ),
                ),

                SizedBox(
                  width: 320.0,
                  height: 50.0,

                  child:
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[800],
                    ),
                    onPressed: () async {
                      registerUser(email, password);
                    },
                    child: const Text("REGISTER"),
                  ),
                ),
                const SizedBox(height: 20.0),

              ],
            ),
          ),
          buildToggleView(),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildForm();
  }
}
