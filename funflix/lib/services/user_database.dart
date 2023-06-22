import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

class UserDataServices {
  UserDataServices();

  String getUID(){
    return FirebaseAuth.instance.currentUser!.uid;
  }

  createUserField(String uid) {
    final docUser = FirebaseFirestore.instance.collection('users').doc(uid);
    docUser.set({
      'subscription' : false,
      'passcode' : '',
    });
  }

  createUserWatchesField(String uid) {
    final docUser2 = FirebaseFirestore.instance.collection('userWatches').doc(uid);
    docUser2.set({
      'movieHistory' : [],
      'movieBlocked' : [],
      'favorite' : [],
    });
  }

  Future initiateNewUser() async {
    String uid = getUID();
    createUserField(uid);
    createUserWatchesField(uid);
  }

  // Future<void> checkAndCreateDocument(String collection) async {
  //   final DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
  //     .collection('user')
  //     .doc(getUID())
  //     .get();


  //   if (!snapshot.exists) {
  //     if(collection == 'user') await createUserField(getUID());
  //     if(collection == 'userWatches') await createUserWatchesField(getUID());
  //   }
  // }

  // Future<dynamic> getDocumentFieldValue(String collection, String field) async {
  //   print('==============================');
  //   final DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
  //     .collection(collection)
  //     .doc(getUID())
  //     .get();

  //   print('HELP : ' + snapshot.toString());

  //   // dynamic fieldValue = documentSnapshot.get(field);
  //   // print('HELP : ' + documentSnapshot.get(field));
  //   // print('ay' + fieldValue);
  //   return snapshot.get(field);
  // }

  bool containsOnlyNumbers(String value) {
    // print('value' + value);
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(value);
  }



  dynamic getUserDetail(String collection) async {
    final uid = getUID();
    List data = [];
    try{
      await FirebaseFirestore
        .instance
        .collection(collection)
        .doc(uid)
        .get()
        .then(
          (value) => {
            data.add(value)
          },
        );
        return data;
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  bool checkPasscodeCreated() {
    List a = getUserDetail('users');
    // Future value = axes('user', getUID());
    // getUserName();
    print('----------------------');
    print(a);
    print('checking the empty');
    // if (value.toString().isEmpty) return false ;
    print('checking numbers only');
    // print('THIS IS : ' + value.toString());
    // if (!containsOnlyNumbers(value.toString())) return false;
    print('all passed');
    return false;
  }

  Future updateData(Map<Object,Object> data, String collection) async {
    String uid = getUID();
    final docUser = FirebaseFirestore.instance.collection(collection).doc(uid);
    await docUser.update(data);
  }



}

