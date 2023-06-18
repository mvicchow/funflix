import 'package:flutter/material.dart';

class PasscodeScreen extends StatefulWidget {
  @override
  _PasscodeScreenState createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  String passcode = '';

  void enterDigit(String digit) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Passcode'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter your passcode',
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
              for (int i = 1; i <= 9; i++)
                GestureDetector(
                  onTap: () => enterDigit(i.toString()),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        i.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              GestureDetector(
                onTap: () => enterDigit('0'),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: deleteDigit,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.backspace,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: validatePasscode,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
