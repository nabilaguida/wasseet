import 'package:brikoula/providers/home_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import './projetct_creation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'art.dart';

class Home_home extends StatefulWidget {
  @override
  _Home_homeState createState() => _Home_homeState();
}

class _Home_homeState extends State<Home_home> {
  Color color1 = Color.fromRGBO(229, 170, 57, 1);
  Color color2 = Color.fromRGBO(223, 172, 42, 1);
  Color color3 = Color.fromRGBO(244, 162, 97, 1);
  Color color = Color(0xFFB74093).withOpacity(0.5);
  CollectionReference categories =
      FirebaseFirestore.instance.collection("categories");
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: ListView(
      children: [
        Container(
          height: height * 0.6,
          child: Stack(
            children: [
              Container(
                  clipBehavior: Clip.hardEdge,
                  height: height * 0.5,
                  decoration: BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(70),
                          bottomLeft: Radius.circular(70))),
                  child: Stack(
                    children: [
                      Positioned.fill(
                          right: -width * 1.35,
                          bottom: width * 0.33,
                          top: -width * 0.75,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.3),
                            ),
                          )),
                      Positioned.fill(
                          right: width * 0.6,
                          bottom: width * 0.45,
                          top: width * 0.15,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.2),
                            ),
                          )),
                    ],
                  )),
              Positioned(
                right: -width * 0.036,
                bottom: width * 0.036,
                child: Container(
                  height: height * 0.51,
                  child: Image.asset(
                    'images/builderAsset 2.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: width * 0.25,
                left: width * 0.036,
                child: Container(
                    alignment: Alignment.centerLeft,
                    height: height * 0.2,
                    width: width * 0.65,
                    child: FutureBuilder(
                      future: FirebaseFirestore.instance.collection('users').doc('${FirebaseAuth.instance.currentUser.uid}').get(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData == false){
                                return CircularProgressIndicator() ;
                        }else{
                          return Text(
                            'Welcome Back \n${snapshot.data.data()['first_name']}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5),
                          );

                        }
                      }
                    )),
              ),
              Positioned(
                top: height * 0.275,
                child: Center(
                  child: Container(
                    width: width,
                    height: height * 0.1,
                    child: Center(
                      child: Container(
                        width: width * 0.9,
                        height: height * 0.08,
                        child: Center(
                            child: ListTile(
                          leading: Icon(Icons.location_on_outlined),
                          title: Text(
                            "El mouroudj Bordj ghedir alger",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.4,
                child: Center(
                  child: Container(
                    width: width,
                    height: height * 0.188,
                    child: Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                        width: width * 0.9,
                        height: height * 0.31,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
//                          border: Border.all(width: 1, color: color2),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Create a new \n Project',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            project_creation()));
                              },
                              child: Container(
                                width: width * 0.45,
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(223, 172, 42, 1)
                                          .withOpacity(0.8),
                                      Color.fromRGBO(223, 172, 42, 1)
                                    ])),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Center(
                                          child: Text(
                                            'Create',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                      flex: 1,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.424,
                left: width * 0.62,
                child: Container(
                  height: width * 0.31,
                  width: width * 0.33,
                  child: Image.asset(
                    "images/create@182x.png",
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Our servises",
            style: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: FontWeight.w700,
                color: Colors.grey[700]),
          ),
        ),
        FutureBuilder(
          future: categories.get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            if (snapshot.hasData) {
              return ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, int i) {
                    return cards(
                        context,
                        Color(int.parse(
                            "${snapshot.data.docs[i].data()['color']}")),
                        "${snapshot.data.docs[i].data()['ctr_name']}",
                        "${snapshot.data.docs[i].data()['nb_artisans']}",
                        "${snapshot.data.docs[i].data()['icon']}",
                        "${snapshot.data.docs[i].data()['ctr_name']}");
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
        )
      ],
    ));
  }
}

Widget cards(BuildContext context, Color color, String title, String nb,
    String icon, String cat) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Consumer<home_provider>(builder: (context, artisan, child) {
    return GestureDetector(
      onTap: () async {
        artisan.artisans.clear() ;
        artisan.ids.clear() ;
        artisan.decoration.clear() ;
       await artisan.getartisansdata(cat);
       Navigator.push(context, MaterialPageRoute(builder: (context)=>art()));
      //  artisan.getprojectdata(cat);
      },
      child: Container(
        width: width,
        height: height * 0.13,
        child: Center(
          child: Container(
            width: width * 0.95,
            decoration: BoxDecoration(
                color: color.withOpacity(0.08),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      height: height * 0.097,
                      width: height * 0.097,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [color, color.withOpacity(0.5)]),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Center(
                        child: Image.network(
                          "$icon",
                          color: Colors.white,
                          width: width * 0.15,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      width: width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$title",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                                fontSize: 15,
                                color: Colors.black45),
                          ),
                          Text(
                            "$nb artisans",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                                fontSize: 11,
                                color: Colors.black45),
                          ),
                        ],
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      height: width * 0.09,
                      width: width * 0.09,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: color),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Icon(
                        Icons.arrow_forward,
                        color: color,
                        size: 20,
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  });
}
