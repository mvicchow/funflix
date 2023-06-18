import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataServices {
  final String uid;
  UserDataServices( {required this.uid} );

  // cek user is valid with the uid
  bool validUser(uid){
    return uid == FirebaseAuth.instance.currentUser!.uid ? true : false;
  }

  Future initiateNewUser() async {
    if (!validUser(uid)) return;
    final docUser = FirebaseFirestore.instance.collection('users').doc(uid);
    docUser.set({
      'subscription' : false,
      'passcode' : -1,
    });
    final docUser2 = FirebaseFirestore.instance.collection('userWatches').doc(uid);
    docUser2.set({
      'movieHistory' : [],
      'movieBlocked' : [],
      'favorite' : [],
    });
  }

}
