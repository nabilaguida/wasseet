import 'package:brikoula/artisan/providers/artisans_provider.dart';
import 'package:brikoula/artisan/providers/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Job_Requests extends StatefulWidget {
  @override
  _Job_RequestsState createState() => _Job_RequestsState();
}

class _Job_RequestsState extends State<Job_Requests> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Color color1 = Color.fromRGBO(237, 183, 74, 1);
    Color color2 = Color.fromRGBO(11, 71, 111, 1);
    Color color3 = Color.fromRGBO(11, 155, 141, 1);
  var artisaninfo =   Provider.of<artisans_provider>(context) ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color2,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: color2 ,
      body: ListView(
        children: [
          Container(
            height: height * 0.11,
            width: width,
            color: color2,
            child :Center(
              child: Text("Job Requests",style: TextStyle(fontSize: 30,letterSpacing: 2.5,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ),
          Container(
            height: height,
            padding: EdgeInsets.only(top: width*0.15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(40))
            ),
            child: FutureBuilder(
              future: FirebaseFirestore.instance.collection('Building').doc('XXimvBl2IHFq7VS4ojvr').collection('requests').get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }
                if (snapshot.hasData) {
                  return ListView.separated(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, int i) {
                         return Center(child:  requestCard(context, "${snapshot.data.docs[i].data()['username']}", "${snapshot.data.docs[i].data()['profile pic']}","${snapshot.data.docs[i].data()['brief']}"),);
                      },
                      separatorBuilder: (context, int i) {
                        return SizedBox(
                          height: width * 0.04,
                        );
                      },
                      itemCount: snapshot.data.docs.length);
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                return Text("loading");
              },
            ),
          )
        ],
      ),
    );
  }
}

requestCard(BuildContext context,String name, String image , String br ){
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  Color color1 = Color.fromRGBO(237, 183, 74, 1);
  Color color2 = Color.fromRGBO(11, 71, 111, 1);
  Color color3 = Color.fromRGBO(11, 155, 141, 1);
  return Container(
    width: width * 0.95,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1),
          BoxShadow(
              color: Colors.grey[400],
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1)
        ],
        borderRadius:
        BorderRadius.circular(width * 0.08)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: width * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            Container(
              height: width*0.18,
              width: width*0.18,
              child: Center(
                  child: image == "null" ? Container(
                    width: width*0.18,
                    decoration: BoxDecoration(
                        color: color2.withOpacity(0.7),
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Text("${name[0].toString().toUpperCase()}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30,color: Colors.white),),
                    ),
                  ):Container(
                    width: width*0.18,
                    decoration: BoxDecoration(
                        color: color2.withOpacity(0.7),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage("$image")
                        )
                    ),
                  )
              ),
            ),
            SizedBox(
              width: width * 0.025,
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Text("$name",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                SizedBox(height: width * 0.005),
                Text("Log 248, CentreVille, BBA",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: '',
                        color: Colors.grey[700])),
              ],
            ),
            SizedBox(width: width * 0.05),
            Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: height / 24,
                    width: height / 24,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: Colors.green),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.done,
                      color: Colors.green,
                      size: height / 30,
                    ),
                  ),
                ),
                SizedBox(height: width * 0.015),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: height / 24,
                    width: height / 24,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: Colors.redAccent[700]
                              .withOpacity(.5)),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.close,
                        color: Colors.redAccent[700]
                            .withOpacity(.5),
                        size: height / 30),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: width * 0.03,
        ),
        Container(
          width: width * 0.75,
          child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.center,
              children: [
                Text("Brief :",
                    style: TextStyle(
                        fontSize: width * 0.05)),
                SizedBox(
                  height: width * 0.01,
                ),
                Text(
                    "$br",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: '',
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400)),
                SizedBox(height: width * 0.05),
              ]),
        )
      ],
    ),
  );
}