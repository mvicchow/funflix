import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService( {required this.uid} );

  final CollectionReference movieCollection = FirebaseFirestore.instance.collection("moviePlaylist");
  Future updateUserPlaylist(String movie) async{
    return await movieCollection.doc(uid).set({
      'movie' :  [movie]
    });
  }
}
