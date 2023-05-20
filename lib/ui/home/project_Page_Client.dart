import 'package:brikoula/providers/project_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class project_client extends StatefulWidget {
  @override
  project_clientState createState() => project_clientState();
}

class project_clientState extends State<project_client> {
  Color secondary = Color.fromRGBO(233, 196, 106, 1);
  Color primary = Color.fromRGBO(19, 36, 40, 1);
  Color elec = Color.fromRGBO(255, 40, 40, 0.8);
  Color whi = Colors.white.withOpacity(0.7);
  Color primcolor = Color.fromRGBO(223, 172, 42, 1);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var mypro = Provider.of<projectProvider>(context);
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: width * 0.13,
                                height: height * 0.045,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30)),
                                  color: primcolor,
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 9,
                            child: Container(
                              height: height * 0.12,
                              width: width * 0.3,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              width: width * 0.25,
                              height: width * 0.09,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border:
                                      Border.all(width: 2, color: primcolor)),
                              alignment: Alignment.center,
                              child: Text(
                                "Edit",
                                style: TextStyle(color: primcolor),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02),
                                height: MediaQuery.of(context).size.height / 27,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.pink),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    '${mypro.myprojects[mypro.index]['ctr_name'][0]}',
                                    style: TextStyle(
                                        color: Colors.pink,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Text(
                                '${mypro.myprojects[mypro.index]['title']}    ',
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height / 250),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.76,
                        child: Center(
                          child: Text(
                            "${mypro.myprojects[mypro.index]['description']}",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(height: height / 20),
                    ],
                  ),
                ),
              ),

              // the tab bar with two items
              Container(
                height: 50,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      spreadRadius: 3,
                      offset: Offset(3, 3),
                      blurRadius: 10),
                ]),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: primary,
                  bottom: TabBar(
                    indicatorWeight: 3,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text(
                          'Overview',
                          style: TextStyle(
                              fontFamily: "Montserrat-Light.ttf",
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Offers',
                          style: TextStyle(
                              fontFamily: "Montserrat-Light.ttf",
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // create widgets for each tab bar here
              Expanded(
                child: TabBarView(
                  children: [
                    // first tab bar view widget
                    Container(
                      color: primary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: ListView(
                          children: [
                            SizedBox(height: height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Description :",
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white)),
                                Icon(Icons.info_outline, color: primcolor),
                              ],
                            ),
                            SizedBox(
                              height: width * 0.01,
                            ),
                            Text(
                                "${mypro.myprojects[mypro.index]['description']}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: '',
                                    color: Colors.grey[300],
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: width * 0.04,
                            ),
                            Container(
                              height: width * 0.005,
                              width: width * 0.9,
                              decoration:
                                  BoxDecoration(color: Colors.grey[400]),
                            ),
                            SizedBox(
                              height: width * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Address :",
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white)),
                                Icon(Icons.location_on_outlined,
                                    color: primcolor),
                              ],
                            ),
                            SizedBox(
                              height: width * 0.01,
                            ),
                            Text("${mypro.myprojects[mypro.index]['adress']}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: '',
                                    color: Colors.grey[300])),
                            SizedBox(
                              height: width * 0.04,
                            ),
                            Container(
                              height: width * 0.005,
                              width: width * 0.9,
                              decoration:
                                  BoxDecoration(color: Colors.grey[400]),
                            ),
                            SizedBox(
                              height: width * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Pictures :",
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white)),
                                Icon(Icons.photo_outlined, color: primcolor),
                              ],
                            ),
                            SizedBox(height: width * 0.01),
                            Text("swipe left to see all pictures",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: '',
                                    color: Colors.grey[300])),
                            SizedBox(height: width * 0.03),
                            Container(
                              width: width,
                              height: height * 0.18,
                              child: Center(
                                child: Container(
                                  height: width / 1.5,
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
                    ),

                    // second tab bar viiew widget
                    Container(
                      color: primary,
                      child: Column(
                        children: [
                          SizedBox(
                            height: width * 0.04,
                          ),
                          Center(
                            child: Text(
                              "Painting",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          khadam(
                              context,
                              "Aguida nabil ",
                              "bordj ghedir bba",
                              "https://lh3.googleusercontent.com/ogw/ADea4I730EWEiSqK94D_9xCai9Zc8nyvowNHsGWHYj6ApA=s64-c-mo",
                              "4",
                              "8"),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          khadam(context, "Seddiki mohamed ", "500 bba", "",
                              "5.4", "6"),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          khadam(
                              context,
                              "Youcef bellaili ",
                              "bordj ghedir bba",
                              "https://photo.maxifoot.fr/youcef-belaili-3.jpg",
                              "5",
                              "7"),
                        ],
                      ),
//                    ListView.separated(
//                        physics: ScrollPhysics(),
//                        shrinkWrap: true,
//                        itemBuilder: (context, i){
//                      return Center(
//                        child: Container(
//                          width: width*0.95,
//                           height: height*0.77,
//                    //    height: width*0.2,
//                          decoration: BoxDecoration(
//                            color: Colors.white.withOpacity(0.2),
//                          ),
//                          child: Center(
//                            child: ListView.builder(
//                                physics: ScrollPhysics(),
//                                shrinkWrap: true,
//                                itemBuilder: (context,j){
//                              return offercard(context,
//                              ""
//                              ) ;
//                            },  itemCount: 5),
//                          ),
//                        ),
//                      );
//                    }, separatorBuilder: (context ,i){
//                      return SizedBox(
//                        height: width*0.1,
//                      );
//                    }, itemCount: mypro.myprojects[mypro.index]['ctr_name'].length),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget khadam(BuildContext context, String fullname, String ad,
    String profile_pic, String price, String time) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  Color primary = Color.fromRGBO(19, 36, 40, 1);
  return Center(
    child: Container(
      width: width * 0.95,
      height: width * 0.27,
      decoration: BoxDecoration(
        color: Colors.grey[100].withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 5,
            child: Center(
                child: profile_pic == ""
                    ? Container(
                        height: width * 0.15,
                        width: width * 0.15,
                        decoration: BoxDecoration(
                          color: primary,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "${fullname[0].toUpperCase()}",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    : Container(
                        height: width * 0.15,
                        width: width * 0.15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage("$profile_pic")),
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      )),
          ),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 16,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$fullname',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '$ad',
                    style: TextStyle(
                      height: 1.1,
                      fontSize: 14,
                      color: Colors.grey[300],
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: height * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Color.fromRGBO(223, 172, 42, 1),
                              size: 20,
                            ),
                            SizedBox(width: 3),
                            Text(
                              "$time days ",
                              style: TextStyle(
                                  fontFamily: "",
                                  color: Colors.grey[100],
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Icon(
                              LineIcons.moneyBill,
                              color: Color.fromRGBO(223, 172, 42, 1),
                              size: 21,
                            ),
                            Text(
                              "$price millions ",
                              style: TextStyle(
                                  fontFamily: "",
                                  color: Colors.grey[100],
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                    )),
                child: Center(
                  child: Container(
                    width: width*0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,color: Colors.green
                      )
                    ),
                    child: Center(
                      child: Icon(Icons.check,color: Colors.green,),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
