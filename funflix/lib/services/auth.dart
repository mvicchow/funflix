import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseInstance = FirebaseAuth.instance;

  // User _authenticatedUser(UserCredential user){
  //   // return user != null ? User(uid: user.uid);
  // }

  Future signInWithEmailPassword() async {
    try {

      UserCredential user;
      user = await _firebaseInstance.signInAnonymously();
      print(user);
      // // user = await _firebaseInstance.signInWithEmailAndPassword(email: "", password: "");
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
