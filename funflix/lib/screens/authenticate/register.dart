import 'package:flutter/material.dart';
import 'package:funflix/services/auth.dart';
import 'package:funflix/widgets/loading.dart';

class Register extends StatefulWidget {
  final Function() toggleView;
  Register({super.key, required this.toggleView});

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

  void registerUser() async {
    if (_formKey.currentState!.validate()) {
      // Form validation successful, proceed with registration
      print("$email $password $confirmPassword");
      // Call the AuthService method to register the user
    }
  }

  Widget buildForm() {
    return loading ? Loading() : Column(
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
                    prefixIcon: Icon(Icons.lock),
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
                    if (value != null && value.isEmpty){
                      return "Confirm Password can't be empty";
                    }
                    if (value != password){
                      return "Confirm Password & Password doesn't match ";
                    }

                    return null;
                  },
                ),
              ),

              Text(
                errorMsg,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14
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
                    if(_formKey.currentState!.validate()){
                      loading = true;
                      dynamic result = await _auth.signUpUser(email, password);
                      print(result);
                      if(result == null){
                        setState(() {
                          errorMsg = "Email is already exists!";
                          loading = false;
                        });
                      }
                    }
                  },
                  child: const Text("REGISTER"),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
        TextButton(
          onPressed: (){
            widget.toggleView();
          },
          child:
          Text('Already have an account? Log in here',
            style: TextStyle(
              color: Colors.orange[400]
            )
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildForm();
  }
}
