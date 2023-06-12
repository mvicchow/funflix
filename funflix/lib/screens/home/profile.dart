import 'package:flutter/material.dart';
import 'package:funflix/services/auth.dart';

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        await _auth.signOut();
      },
      child: const Text('Sign Out'),
    );
  }
}
