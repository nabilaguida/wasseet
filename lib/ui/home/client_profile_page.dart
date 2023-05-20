import 'package:brikoula/auth/mobile.dart';
import 'package:brikoula/providers/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Client_Profile_Page extends StatefulWidget {
  @override
  _Client_Profile_PageState createState() => _Client_Profile_PageState();
}

class _Client_Profile_PageState extends State<Client_Profile_Page> {
  @override
  Widget build(BuildContext context) {
    final heightt = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Color primcolor = Color.fromRGBO(223, 172, 42, 1);
    Color color1 = Color.fromRGBO(11, 81, 111, 1);
    var log = Provider.of<signupprovider>(context) ;
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').doc('${FirebaseAuth.instance.currentUser.uid}').get(),
        builder: (context, snapshot) {
          // ignore: unrelated_type_equality_checks
          if( snapshot.hasData == false){
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }else{
            return Scaffold(
              backgroundColor: Colors.grey[100],
              body: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(height: width * 0.07),
                          Container(
                              height: heightt * 0.1,
                              alignment: Alignment.bottomLeft,
                              width: width * 0.9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: color1,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  GestureDetector(
                                    onTap: ()async{
                                      await log.signout() ;
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
                                    },
                                    child: Container(
                                      width: width * 0.25,
                                      height: width * 0.09,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                          border: Border.all(width: 2, color: primcolor)),
                                      child: Center(
                                        child: Text(
                                          "LogOut",
                                          style: TextStyle(color: primcolor),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(height: width * 0.07),
                          snapshot.data.data()['profike_pic'] != null ?Container(
                            width: width * 0.25,
                            height: width * 0.25,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${snapshot.data.data()['profike_pic']}"),
                                    fit: BoxFit.fill),
                                shape: BoxShape.circle,
                                border: Border.all(width: 4, color: color1)),
                          ):Container(
                            width: width * 0.25,
                            height: width * 0.25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color1
                            ),
                            child: Center(
                              child: Text("${snapshot.data.data()['full_name'][0].toString().toUpperCase()}",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w800),),
                            ),
                          ),
                          SizedBox(height: width * 0.11),
                          Container(
                            width: width * 0.9,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("FullName",
                                          style: TextStyle(
                                              color: primcolor, fontSize: 16)),
                                      SizedBox(
                                        height: width * 0.01,
                                      ),
                                      Text("${snapshot.data.data()['full_name']}",
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontFamily: '',
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  Container(
                                      width: width * 0.08,
                                      height: width * 0.08,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 2, color: Colors.grey[500])),
                                      child: Center(
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.grey[500],
                                            size: 18,
                                          ))),
                                ]),
                          ),
                          SizedBox(height: width * 0.05),
                          Container(
                            width: width * 0.9,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Address",
                                          style: TextStyle(
                                              color: primcolor, fontSize: 16)),
                                      SizedBox(height: width * 0.01),
                                      Text("${snapshot.data.data()['address']}",
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontFamily: '',
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  Container(
                                      width: width * 0.08,
                                      height: width * 0.08,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 2, color: Colors.grey[500])),
                                      child: Center(
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.grey[500],
                                            size: 18,
                                          ))),
                                ]),
                          ),
                          SizedBox(height: width * 0.05),
                          Container(
                            width: width * 0.9,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Phone number",
                                          style: TextStyle(
                                              color: primcolor, fontSize: 16)),
                                      SizedBox(
                                        height: width * 0.01,
                                      ),
                                      Text("${FirebaseAuth.instance.currentUser.phoneNumber}",
                                          style: TextStyle(
                                              color: Colors.grey[700],

                                              fontFamily: '',
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  Container(
                                      width: width * 0.08,
                                      height: width * 0.08,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 2, color: Colors.grey[500])),
                                      child: Center(
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.grey[500],
                                            size: 18,
                                          ))),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: heightt * 0.25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: width * 0.01),
                        Container(
                          height: heightt * 0.2,
                          width: width * 0.28,
                          decoration: BoxDecoration(
                              color: primcolor.withOpacity(.8),
                              borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(20))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(LineIcons.phone,
                                  color: Colors.white, size: width * 0.1),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text(
                                'Contact us',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: heightt * 0.2,
                          width: width * 0.28,
                          decoration: BoxDecoration(
                            color: color1.withOpacity(.8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(LineIcons.heart, color: Colors.white, size: width * 0.1),
                              SizedBox(height: width * 0.03),
                              Text(
                                'Favorites',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 0.9,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: heightt * 0.2,
                          width: width * 0.28,
                          decoration: BoxDecoration(
                              color: primcolor.withOpacity(.8),
                              borderRadius:
                              BorderRadius.only(topRight: Radius.circular(20))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LineIcons.info,
                                color: Colors.white,
                                size: width * 0.1,
                              ),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text(
                                'About App',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: width * 0.01),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

      }
    );
  }
}

Widget card(BuildContext context, String title, int umber) {
  final heightt = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    height: heightt * 0.2,
    color: Colors.red,
    width: width * 0.27,
  );
}
