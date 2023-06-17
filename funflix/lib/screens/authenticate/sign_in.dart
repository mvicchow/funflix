import 'package:flutter/material.dart';
import 'package:funflix/services/auth.dart';
import 'package:funflix/widgets/loading.dart';

class SignIn extends StatefulWidget {
  final Function() toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String errorMsg = "";

  void signInUser(email, password) async {
    if(_formKey.currentState!.validate()){
      setState(() {
        loading = true;
      });
      dynamic result = await _auth.signInWithEmailPassword(email, password);
      if(result == null){
        setState(() {
          errorMsg = "Email and/or password credentials is incorrect!";
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
      child: Text(
        'Don\'t have an account? Register here',
        style: TextStyle(color: Colors.orange[400],),
      ),
    );
  }

  Widget buildForm(){
    if(loading){
      return const Loading();
    } else{
      return
      Column(
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
                    signInUser(email, password);
                  },
                  child: const Text("SIGN IN"),
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
