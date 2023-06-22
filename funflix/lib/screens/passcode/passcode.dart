import 'package:flutter/material.dart';
import 'package:funflix/screens/home/home.dart';
import 'package:funflix/screens/wrapper.dart';
import 'package:funflix/services/user_database.dart';

class NumButton extends StatelessWidget {
  late int digit = 0;
  NumButton({super.key, required this.digit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orange,

      ),
      child: Center(
        child: Text(
          digit.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


// ignore: must_be_immutable
class PasscodeScreen extends StatefulWidget {
  int mode; //mode 0 create passcode mode 1 using password
  String titleText;
  PasscodeScreen({required this.titleText, required this.mode});
  @override
  _PasscodeScreenState createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {

  String passcode = '';

  void enterDigit(String digit) {
    if(passcode.length >= 4) return;
    setState(() {
      passcode += digit;
    });
  }

  void deleteDigit() {
    setState(() {
      if (passcode.isNotEmpty) {
        passcode = passcode.substring(0, passcode.length - 1);
      }
    });
  }

  void validatePasscode() {
    if (passcode == '1234') {
      // Passcode is correct, perform desired action
      print('Passcode is correct');
      // TODO: Add your logic here
    } else {
      // Passcode is incorrect, display error message or take appropriate action
      print('Passcode is incorrect');
      // TODO: Add your logic here
    }
  }

  void createPasscode() {
    UserDataServices().updateData({'passcode' : passcode}, 'users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.titleText, style: TextStyle(
              color: Colors.orange[700],
              fontSize: 44,
              fontWeight: FontWeight.bold
            ),),
            Text(
              'Enter 4 digits for your passcode',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              passcode,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 1; i <= 3; i++)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                        child: GestureDetector(
                          onTap: () => enterDigit(i.toString()),
                          child: NumButton(digit: i)
                        ),
                      ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 4; i <= 6; i++)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                        child: GestureDetector(
                          onTap: () => enterDigit(i.toString()),
                          child: NumButton(digit: i)
                        ),
                      ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 7; i <= 9; i++)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                        child: GestureDetector(
                          onTap: () => enterDigit(i.toString()),
                          child: NumButton(digit: i)
                        ),
                      ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                      child: GestureDetector(
                        onTap: () => enterDigit('0'),
                        child: NumButton(digit: 0)
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                      child: GestureDetector(
                        onTap: deleteDigit,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: const Icon(
                            Icons.backspace,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
            SizedBox(height: 20),
            // PasscodeCircle(),
            SizedBox(
              width: 250,
              height: 65,
              child: ElevatedButton(
                onPressed: (){
                  if (widget.mode==0){
                    createPasscode();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Wrapper()));
                  }
                },
                child: Text('Submit'),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange[800]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
