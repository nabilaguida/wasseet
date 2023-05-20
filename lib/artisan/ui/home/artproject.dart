import 'package:brikoula/artisan/providers/artisans_provider.dart';
import 'package:brikoula/providers/project_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class artproject extends StatefulWidget {
  @override
  _artprojectState createState() => _artprojectState();
}

class _artprojectState extends State<artproject> {
  Color secondary = Color.fromRGBO(233, 196, 106, 1);
  Color primary = Color.fromRGBO(19, 36, 40, 1);
  Color elec = Color.fromRGBO(255, 40, 40, 0.8);
  Color whi = Colors.white.withOpacity(0.7);
  TextEditingController price = TextEditingController() ;
  TextEditingController time = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var pro = Provider.of<artisans_provider>(context);
    Color color1 = Color.fromRGBO(1, 41, 81, 1);
    Color color2 = Color.fromRGBO(11, 71, 111, 1);
    Color color3 = Color.fromRGBO(11, 155, 141, 1);
    return SafeArea(
        child: Scaffold(
            backgroundColor: color2,
            body: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.3,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(30)),
                                        color: Colors.white,
                                      ),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: color2,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    width: width * 0.5,
//                                      height: height * 0.035,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Text(
                              'ghfjnfbbfjnf',
                          //    '${pro.projects[pro.index]['title']}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width * 0.15,
                                    height: width * 0.15,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                        shape: BoxShape.circle,

                                        ),
                                    child: Center(
                                        child: Text(
                                          "N",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                  ),
                                  SizedBox(width: width * 0.02),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Aguida Nabil",
//                                        '${pro.userinfo[pro.index]['first_name']} ${pro.userinfo[pro.index]['last_name']}',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      Text(
                                        "El mourouj bordj ghedir",
                                        //  "${pro.projects[pro.index]['adress']}",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: '',
                                              color: Colors.grey[200])),
                                    ],
                                  ),
                                  SizedBox(width: width * 0.04),
                                  GestureDetector(
                                    onTap: () {
                                      return showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Text("Give offer"),
                                          content: Column(
                                            children: [
                                              TextField(
                                                controller: price,
                                                decoration: InputDecoration(
                                                  hintText: "price",
                                                    icon: Icon(
                                                        Icons.price_change_outlined)),
                                              ),
                                              TextField(
                                                controller: time,
                                                decoration: InputDecoration(
                                                  hintText: "time to complete the job",
                                                    icon: Icon(
                                                        Icons.timer)),
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              onPressed: () {
                                              pro.addOffer(time.text, price.text, pro.index) ;
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Text(
                                                "Confirm",
                                                style: TextStyle(color: Colors.blue[900]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: width * 0.18,
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Apply',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            letterSpacing: 0.5),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        width: width,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(width * 0.1),
                              topRight: Radius.circular(width * 0.1)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.15),
                                spreadRadius: 2,
                                offset: Offset(-4, -2),
                                blurRadius: 17),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          width: width * 0.9,
                          child: ListView(
                            children: [
                              Container(
                                  child: Column(
                                children: [
                                  SizedBox(height: width * 0.04),
                                  Text("Project info",
                                      style: TextStyle(fontSize: 24)),
                                  SizedBox(height: width * 0.06),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Description :",
                                                style: TextStyle(fontSize: 19)),
                                            Icon(Icons.info_outline,
                                                color: color3),
                                          ],
                                        ),
                                        SizedBox(
                                          height: width * 0.01,
                                        ),
                                        Text(
                                          "jbvhfjbbfbfbfbfbf",
                                          //  "${pro.projects[pro.index]['description']}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: '',
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(
                                          height: width * 0.04,
                                        ),
                                        Container(
                                          height: width * 0.005,
                                          width: width * 0.9,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300]),
                                        ),
                                        SizedBox(
                                          height: width * 0.04,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Address :",
                                                style: TextStyle(fontSize: 19)),
                                            Icon(Icons.location_on_outlined,
                                                color: color3),
                                          ],
                                        ),
                                        SizedBox(
                                          height: width * 0.01,
                                        ),
                                        Text(
                                          "Elmourouj bordj ghedir",
                                         //   "${pro.projects[pro.index]['adress']}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: '',
                                                color: Colors.grey[700])),
                                        SizedBox(
                                          height: width * 0.04,
                                        ),
                                        Container(
                                          height: width * 0.005,
                                          width: width * 0.9,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300]),
                                        ),
                                        SizedBox(
                                          height: width * 0.04,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Pictures :",
                                                style: TextStyle(fontSize: 19)),
                                            Icon(Icons.photo_outlined,
                                                color: color3),
                                          ],
                                        ),
                                        SizedBox(height: width * 0.01),
                                        Text("swipe left to see all pictures",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: '',
                                                color: Colors.grey[500])),
                                        SizedBox(height: width * 0.02),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                          ),
                                          width: width,
                                          height: height * 0.18,
                                          child: Center(
                                            child: Container(
                                              height: width / 1.2,
                                              child: ListView(
                                                scrollDirection: Axis.horizontal,
                                                children: [
                                                  SizedBox(width: width*0.05),
                                                  Center(
                                                    child: Image.network(
                                                        "https://firebasestorage.googleapis.com/v0/b/brikoola-ef2b4.appspot.com/o/41158925-white-blank-poster-on-shelve-and-drop-to-the-ground-in-an-empty-room-is-painted-red-with-decorate-wo.jpg?alt=media&token=00b8ad76-da68-4255-bd69-0f9cb378bcc0"
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width*0.1,
                                                  ),
                                                  Center(
                                                    child: Image.network(
                                                        "https://firebasestorage.googleapis.com/v0/b/brikoola-ef2b4.appspot.com/o/listing-paysage-VALENTINA-Chene-Sierra-2021.jpg-crop-full.jpg?alt=media&token=156f9890-b70c-45a7-9be7-db4494142e02"

                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width*0.1,
                                                  ),
                                                  Center(
                                                    child: Image.network(
                                                        "https://firebasestorage.googleapis.com/v0/b/brikoola-ef2b4.appspot.com/o/41158925-white-blank-poster-on-shelve-and-drop-to-the-ground-in-an-empty-room-is-painted-red-with-decorate-wo.jpg?alt=media&token=00b8ad76-da68-4255-bd69-0f9cb378bcc0"
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width*0.1,
                                                  ),
                                                  Center(
                                                    child: Image.network(
                                                        "https://firebasestorage.googleapis.com/v0/b/brikoola-ef2b4.appspot.com/o/41158925-white-blank-poster-on-shelve-and-drop-to-the-ground-in-an-empty-room-is-painted-red-with-decorate-wo.jpg?alt=media&token=00b8ad76-da68-4255-bd69-0f9cb378bcc0"
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width*0.1,
                                                  ),
                                                  Center(
                                                    child: Image.network(
                                                        "https://firebasestorage.googleapis.com/v0/b/brikoola-ef2b4.appspot.com/o/Red-Painted-Office.jpg?alt=media&token=b4f01839-eb9b-470c-9474-740b2611be3e"),
                                                  ),
                                                  SizedBox(
                                                    width: width*0.1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: width * 0.04,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ])));
  }
}
