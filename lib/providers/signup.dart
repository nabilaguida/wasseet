import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class signupprovider with ChangeNotifier{
  String full_name,email , phone_number ;
  bool done = true ;
  var auth = FirebaseAuth.instance ;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  getuserinfo(String fullname,String emailuser){
    full_name = fullname ;
    email = emailuser ;
    notifyListeners() ;
  }
  Done(bool d){
    done = false ;
    notifyListeners() ;
  }
  getuserphone(String phone){
    phone_number = phone;
    print("phone nb = $phone_number") ;
    notifyListeners() ;
  }
  Future<void> addUser() {
    return users.doc('${FirebaseAuth.instance.currentUser.uid}')
        .set({
      'full_name': full_name,
      'first_name' : "nabil",
      'email': email,
      'phone number': phone_number
    })
        .then((value) {
      print("User Added") ;
      Done(true) ;
    })
        .catchError((error) => print("Failed to add user: $error"));
  }
  signout()async{
    await auth.signOut();
    print("signedout") ;
    print("===============================================") ;
    notifyListeners();
  }

}