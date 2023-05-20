import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class home_provider with ChangeNotifier{
  List decoration=  [] ;
  String khadam_id ;
  int index ;
  String brief ;
  String profile_pic ;
  String username ;// hada bah njib lismm nta3 lclient
  String category  ,icon;
  List comments = [] ;
  List artisans= [] ;
  List userinfo =[] ;
  List ids = [] ;
  var auth = FirebaseAuth.instance ;
  var ctrname = FirebaseFirestore.instance.collection('categories');

  getartisansdata(String categ)async{
   await ctrname.where('ctr_name',isEqualTo: '$categ').get().then((value) {
       decoration.add(value.docs.first.data()) ;
      print(categ) ;
      print(decoration);

    });
  await FirebaseFirestore.instance.collection('$categ').orderBy('avillable',descending: true).get().then((value) {
    value.docs.forEach((element) {
      artisans.add(element.data());
      ids.add(element.id) ;
      print(artisans);
    });
  });

    notifyListeners() ;
  }
  getkhadam_id(String id,i){
    khadam_id = id ;
    index = i ;
    notifyListeners() ;
  }
  getcomments()async{
    await FirebaseFirestore.instance.collection('Building').doc('$khadam_id').collection('reviews').get().then((value) {
      value.docs.forEach((element) {
        comments.add(element.data()['comment']) ;
        getusercommentinfos('${element.id}') ;
        print('========================================');
        print(element.id) ;
        print(comments) ;
        print('user inofs $userinfo') ;
      });
    }) ;
    notifyListeners() ;

  }
  getusercommentinfos(String id)async{
   var user =  await FirebaseFirestore.instance.collection('users').doc('$id').get() ;
    userinfo.add(user.data()) ;
    print('hona l jaza2ir $userinfo') ;
    print('hey = ${userinfo.runtimeType}') ;
    notifyListeners() ;
  }
  getuserprofile()async{
    await FirebaseFirestore.instance.collection('users').doc('${FirebaseAuth.instance.currentUser.uid}').get().then((value)
    {
      username = value.data()['full_name'] ;
      profile_pic = value.data()['profile_pic'] ;
    });
    notifyListeners() ;
  }
  Future<void> addrequest(String ctr , String id ,String br) {
      return FirebaseFirestore.instance.collection('$ctr').doc('$id').collection('requests').add(
     {   'user_id' : FirebaseAuth.instance.currentUser.uid ,
          'artisan_id' : id ,
       "username" : username ,
       "profile_pic" : profile_pic ,
        'brief' : br}
      ).then((value) {
      print("Request Added") ;
    })
        .catchError((error) => print("Failed to add Request: $error"));
  }

}