import 'package:firebase_auth/firebase_auth.dart';
import 'package:funflix/services/database.dart';

class AuthService {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;

  Stream<User?> get user {
    return _authInstance.authStateChanges();
  }

  Future signInWithEmailPassword(email, password) async {
    try {
      UserCredential user;
      user = await _authInstance.signInWithEmailAndPassword(email: email, password: password);
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

  Future signUpUser(String email, String password) async{
    try {
      UserCredential user;
      user = await _authInstance.createUserWithEmailAndPassword(email: email, password: password);
      await DatabaseService(uid: user.user!.uid).updateUserPlaylist("hahah");
      return user.user;
    } catch (e) {

      return null;
    }
  }

}

