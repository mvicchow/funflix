import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;

  Stream<User?> get user {
    return _authInstance.authStateChanges();
  }

  Future signInWithEmailPassword() async {
    try {
      UserCredential user;
      user = await _authInstance.signInAnonymously();
      return user.user;
    } catch (e) {
      print(e.toString());
      return null;

    }
  }

  Future signOut() async{
    try {
      return await _authInstance.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}

