import 'package:brikoula/providers/home_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile_Page extends StatefulWidget {
  @override
  _Profile_PageState createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  Color secondary = Color.fromRGBO(233, 196, 106, 1);
  Color primary = Color.fromRGBO(19, 36, 40, 1);
  Color elec = Color.fromRGBO(255, 40, 40, 0.8);
  Color color1 = Color.fromRGBO(229, 170, 57, 1);
  TextEditingController brief = TextEditingController() ;
  Color whi = Colors.white.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var art = Provider.of<home_provider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: color1,
        //  backgroundColor: Color(int.parse('${art.id}')),
        body: ListView(
          children: [
            Container(
              height: height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: width * 0.05,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: width / 12,
                        width: width / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(45),
                              bottomRight: Radius.circular(45)),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: color1,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.9,
                    child: Row(children: [
                      Spacer(),
                      Stack(
                        children: [
                          Container(
                            width: width * 0.12,
                            height: width * 0.12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.4)),
                          ),
                         art.artisans[art.index]['profile_pic'] != "" ?   CircleAvatar(
                            backgroundImage: NetworkImage(
                                "${art.artisans[art.index]['profile_pic']}"),
                            radius: width * 0.1,
                          ):CircleAvatar(
                         backgroundColor: Colors.white.withOpacity(0.4),
                         foregroundColor: Colors.white.withOpacity(0.4),
                         radius: width*0.1,
                         child: Center(
                           child: Text("${art.artisans[art.index]['full_name'][0].toString().toUpperCase()}",style: TextStyle(fontSize: 30,color: Colors.black54,fontWeight: FontWeight.w800),),
                         ),
                       )
                        ],
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: width * 0.1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${art.artisans[art.index]['full_name']}',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 200),
                          Container(
                            height: MediaQuery.of(context).size.height / 28,
                            padding:
                            EdgeInsets.symmetric(horizontal: width * 0.025),
                            decoration: BoxDecoration(
                                color: whi.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                '${art.decoration[0]['ctr_name']}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(height: height / 110),
                          Container(
                            child: Text(
                              '${art.artisans[art.index]['address']}',
                              style:
                              TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                    ]),
                  ),
                  SizedBox(height: height / 70),
                  Container(
                    width: width * 0.85,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '85%',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 22),
                              ),
                              Text(
                                'Recommended',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              return showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text("Tell me a bit about job"),
                                  content:  TextField(
                                    controller: brief,
                                    decoration: InputDecoration(
                                        hintText: "Brief ",
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: ()async {
                                        await art.getuserprofile() ;
                                        art.addrequest("${art.decoration[0]['ctr_name']}","${art.ids[art.index]}",brief.text) ;
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Text(
                                        "Confirm",
                                        style: TextStyle(color: color1),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              height: width * 0.1,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  'Request',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                  SizedBox(height: height / 200),
                ],
              ),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)),
              ),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 8,
                        child: Text(
                          "About me :",
                          style: TextStyle(fontSize: 18, letterSpacing: 1.5),
                        ),
                      ),
                      Expanded(flex: 4, child: SizedBox()),
                      Expanded(flex: 2, child: Icon(Icons.info_outline)),
                      Expanded(flex: 1, child: SizedBox()),
                    ],
                  ),
                  SizedBox(
                    height: width * 0.01,
                  ),
                  Center(
                    child: Container(
                      width: width * 0.9,
                      child: Text(
                        "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 8,
                        child: Text(
                          "Work samples :",
                          style: TextStyle(fontSize: 18, letterSpacing: 1.5),
                        ),
                      ),
                      Expanded(flex: 4, child: SizedBox()),
                      Expanded(
                          flex: 2, child: Icon(Icons.photo_album_outlined)),
                      Expanded(flex: 1, child: SizedBox()),
                    ],
                  ),
                  SizedBox(
                    height: width * 0.01,
                  ),
                  Container(
                    height: height * 0.2,
                    color: Colors.white,
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
                  SizedBox(height: height / 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 8,
                        child: Text(
                          "Client reviews :",
                          style: TextStyle(fontSize: 18, letterSpacing: 1.5),
                        ),
                      ),
                      Expanded(flex: 4, child: SizedBox()),
                      Expanded(
                          flex: 2, child: Icon(Icons.chat_bubble_outline)),
                      Expanded(flex: 1, child: SizedBox()),
                    ],
                  ),
                  SizedBox(
                    height: width * 0.03,
                  ),
                  Container(
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, int i) {
                          if(art.comments.length == 0){
                            return Center(
                              child: Text("No review yet"),

                            );
                          }return Center(
                            child: commentcard(
                              "${art.userinfo[i]['profile_pic']}",
                              "${art.userinfo[i]['full_name']}",
                              "${art.comments[i]}",
                              context,
                            ),
                          );
                        },
                        separatorBuilder: (context, int i) {
                          return SizedBox(
                            height: width * 0.04,
                          );
                        },
                        itemCount: art.comments.length),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

Widget commentcard(String image, String name, String comment,
    BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    width: MediaQuery.of(context).size.width *0.9,
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.width* 0.2,
              child: Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(image),
                  radius: 25,
                ),
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Container(
                      child: Text(
                        comment,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                           color: Colors.black54, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ],
    ),
  );
}
