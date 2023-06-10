import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _authenticate = FirebaseAuth.instance;

  Future SignInWithEmailPassword() async {
    try {
      UserCredential user;
      user = await _authenticate.signInAnonymously();
      // user = await _authenticate.signInWithEmailAndPassword(email: "", password: "");
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
