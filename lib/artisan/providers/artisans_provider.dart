import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class artisans_provider with ChangeNotifier{
  String id ;
  List userinfo =[] ;
  List requests = [] ;
 List projects =[] ;
 List projectsids = [] ;
 int index ;
  getAllprojects()async{
    await FirebaseFirestore.instance.collection('projects').get().then((value) {
      value.docs.forEach((element) {
        projects.add(element.data()) ;
        projectsids.add(element.id);
        getuserprojectinfo(element.data()['userid']) ;
      });
    });
    notifyListeners() ;

  }
  getindex(int i){
    index = i ;
    notifyListeners();
  }
  getuserprojectinfo(String id)async{
    var user =  await FirebaseFirestore.instance.collection('users').doc('$id').get() ;
    userinfo.add(user.data()) ;
    notifyListeners() ;
  }

  Future<void> addOffer(String tm ,String pr , int index) {
    return FirebaseFirestore.instance.collection('projects').doc(projectsids[index]).collection('offers').add({
      'price': pr,
      'time': tm,
      'artisan id': "5CvpT8P1va1LU6kxdmyb"
    })
        .then((value) => print("offer Added"))
        .catchError((error) => print("Failed to add offer: $error"));
  }
  getuserrequestdata(String userid){
    FirebaseFirestore.instance.collection('users').doc('$userid').get().then((value) {
      requests.add(value.data()) ;
    });
    notifyListeners() ;
  }
}