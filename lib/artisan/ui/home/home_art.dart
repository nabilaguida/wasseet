import 'package:brikoula/artisan/providers/artisans_provider.dart';
import 'package:brikoula/artisan/providers/signup.dart';
import 'package:brikoula/auth/mobile.dart';
import 'package:flutter/material.dart';
import './artproject.dart';
import './sign_up_material.dart';
import './project_browsing.dart';
import 'package:provider/provider.dart';

import 'job_Requests.dart';


class Home_art extends StatefulWidget {
  @override
  _Home_artState createState() => _Home_artState();
}

class _Home_artState extends State<Home_art> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Color color1 = Color.fromRGBO(237, 183, 74, 1);
    Color color2 = Color.fromRGBO(11, 71, 111, 1);
    Color color3 = Color.fromRGBO(11, 155, 141, 1);
    var pr = Provider.of<artisans_provider>(context) ;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Container(
              height: height * 0.4,
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: height * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [color3, color2]),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.4),
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                            blurRadius: 15),
                      ],
                    ),
                    child: Stack(children: [
                      Positioned(
                        left: -width * 0.08,
                        top: -height * 0.22,
                        child: Container(
                            width: width * 0.5,
                            height: height * 0.9,
                            child: Image.asset(
                              "images/builderAsset 1.png",
                            )),
                      ),
                      Positioned(
                          right: -width * 0.25,
                          bottom: -height * 0.36,
                          child: Container(
                            width: width * 0.9,
                            height: width * 0.9,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.2),
                            ),
                          )),
                      Column(
                        children: [
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: width * 0.24),
                              Container(
                                  width: width * 0.5,
                                  height: height * 0.11,
                                  child: Image.asset(
                                    "images/applogowhite.png",
                                  )),
                              Consumer<signupproviderart>(builder: (context,sign,child){
                                return  GestureDetector(
                                  onTap: ()async{
                                    await sign.signout();
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                                  },
                                  child: Container(
                                    width: width * 0.2,
                                    height: width * 0.08,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                        border: Border.all(
                                            width: 1.2,
                                            color: Colors.white.withOpacity(.7))),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Log out",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(.7),
                                          fontFamily: '',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                );
                              }),
                             
                              SizedBox(width: width * 0.03),
                            ],
                          ),
                          SizedBox(height: 45),
                          Container(
                            alignment: Alignment.bottomRight,
                            height: height * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: Text('Welcome Back',
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(.6),
                                              fontFamily: '',
                                              fontSize: 24,
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: 0.5)),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: Text('Mohamed!',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 28,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  )
                ],
              ),
            ),
            SizedBox(height: width * 0.08),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 15,
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>My_Projects()));
                                  },
                                  child: homeCard(
                                      Icons.category, 'My Projects', context)),
                              GestureDetector(
                                  onTap: () async{
                                    pr.projects.clear() ;
                                    await  pr.getAllprojects() ;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                project_browe()));
                                  },
                                  child: homeCard(Icons.search,
                                      'Browse Projects', context)),
                            ],
                          ),
                          SizedBox(height: height * 0.025),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              GestureDetector(
                                  onTap: () {
                                    //            Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_Page()));
                                  },
                                  child: homeCard(
                                      Icons.person, 'Profile', context)),
                              GestureDetector(
                                  onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Job_Requests()));
                                  },
                                  child: homeCard(Icons.article_rounded,
                                      'Job Requests', context)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Container())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
