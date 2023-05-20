import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class signupproviderart with ChangeNotifier{
  String full_name,email , phone_number,password,address ,category;
  var auth = FirebaseAuth.instance ;
  List dropdown_cat = [];
  CollectionReference cat = FirebaseFirestore.instance.collection("categories") ;
  getuserinfo(String fullname,String emailuser,String add,String phone,pass,String cat){
    full_name = fullname ;
    email = emailuser ;
    phone_number = phone ;
    address = add ;
    password = pass ;
    category = cat ;
    notifyListeners() ;
  }
  getcategories()async{
  var response =  await cat.get() ;
    response.docs.forEach((element) {
      dropdown_cat.add(element.data()) ;
    });

  notifyListeners() ;
  }
  setartisansnb(String selectedcategory)async{
    var nb = FirebaseFirestore.instance.collection('categories') ;
    var cat = FirebaseFirestore.instance.collection('$selectedcategory') ;
    var nb_art ;
    var a ;
    int length  = 0;
    await cat.get().then((value){
     length = value.size ;
    } ) ;
    print("*******************************=========================");
    print(length);
     await nb.where('ctr_name',isEqualTo: '$selectedcategory').get().then((value) async{
        a = value.docs.first.id ;
        print("44444444444444444444444444444444444444444444444");
        print("${value.docs.first.runtimeType}") ;
    });
    nb.doc("$a").update(
      {
      'nb_artisans' : "${length}"
      }
    );
  }
  Future<void> addUser(String caty) {
    return  FirebaseFirestore.instance.collection('$caty').doc(FirebaseAuth.instance.currentUser.uid).set({
      'full_name': full_name,
      'email': email,
      'phone number': phone_number,
      'category' :category,
      'address' :address,
      'password' :password,
    })
        .then((value) => print("artisan Added"))
        .catchError((error) => print("Failed to add artisan: $error"));
  }
  signout()async{
    await auth.signOut();
    print("signedout") ;
    print("===============================================") ;

    notifyListeners();
  }

}