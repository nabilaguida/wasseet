import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class projectProvider with ChangeNotifier {
  String title, description, imageurl, userid, adressproject;
  bool urgent;
  List<String> categories = [];
  List offers = [] ;
  List ctr_offers = [] ;
  List myprojects = [] ;
  List Artisansofferdata = [] ;
  List artisans = [] ;
  int index ;
  List projectCardStyle = [] ;
   var auth = FirebaseAuth.instance;
  CollectionReference project =
      FirebaseFirestore.instance.collection('projects');

  getprojectdata(String TITLE, String DESCRIPTION, List cat, String address) {
    // hadi tjib data nta3 project creation
    title = TITLE;
    description = DESCRIPTION;
    cat.forEach((element) {
      categories.add(element);
    });
    if (address == "myad") {
      adressproject = "user address";
    } else {
      adressproject = address;
    }

    notifyListeners();
  }
getindex(int i){
    index = i ;
    notifyListeners() ;
}
  Future<void> addproject() {
    return project
        .add({
          'title': title,
          'description': description,
          'ctr_name': categories,
          'userid': FirebaseAuth.instance.currentUser.uid,
          'adress': adressproject,
      'entries' : 1 ,
          'images' : [
                  "https://firebasestorage.googleapis.com/v0/b/brikoola-ef2b4.appspot.com/o/projects%2FFB_IMG_1623075028486.jpg?alt=media&token=4ac04ff0-7417-4c06-bfb3-1f8667d63a72",
                  "https://firebasestorage.googleapis.com/v0/b/brikoola-ef2b4.appspot.com/o/projects%2FFB_IMG_1623277779673.jpg?alt=media&token=7e53ea24-6bd8-4e6e-b24a-573fd4410de7",
                    "https://firebasestorage.googleapis.com/v0/b/brikoola-ef2b4.appspot.com/o/projects%2FFB_IMG_1624136779088.jpg?alt=media&token=6e0755ff-cc90-4e17-9870-47de8b97eeb3",
                  "https://firebasestorage.googleapis.com/v0/b/brikoola-ef2b4.appspot.com/o/projects%2FFB_IMG_1624137113396.jpg?alt=media&token=dc11a5a1-0726-4a1e-b788-655950d45320"
          ] ,
        })
        .then((value) => print("project Added"))
        .catchError((error) => print("Failed to add project: $error"));
  }




  getmyprojects(List prjt)async{
    prjt.forEach((element) {
      myprojects.add(element) ;
    });
    notifyListeners() ;
  }

  getmyprojectdatactr(String ctr)async{
     await FirebaseFirestore.instance.collection('categories').where('ctr_name',isEqualTo: ctr).get().then((value) {
      value.docs.forEach((element) {
       projectCardStyle.add(element.data()) ;
       print(projectCardStyle) ;
      });
    }) ;

    notifyListeners() ;
  }
  getoffers()async{
    //brings all offers
    await FirebaseFirestore.instance.collection('projects').doc('${myprojects[index].id}').collection('offers').get().then((value) {
      value.docs.forEach((element) {
        offers.add(element.data()) ;
      //  print(offers);
      });
    });
    getartisoffers() ;
    notifyListeners() ;
  }
  getartisoffers()async{
    for(int i=0 ; i < offers.length ;i++){
      await FirebaseFirestore.instance.collection('${offers[i]['ctr_name']}').doc('${offers[i]['artisan id']}').get().then((value) {
        Artisansofferdata.add(value.data()) ;
      });
    //print(Artisansofferdata) ;
    }
  notifyListeners() ;
  }
  setlength()async{
    await   offers.forEach((element) {
      if(ctr_offers.contains(element['ctr_name'])== false){
        ctr_offers.add(element['ctr_name']) ;
      }
    });
    print(ctr_offers.length) ;
notifyListeners() ;
  }
fetchart(String category ,int result,int index){
    if(result == 1){
       Artisansofferdata.forEach((element) {

      });
    }
}
}
