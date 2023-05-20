import 'package:brikoula/artisan/providers/artisans_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'artproject.dart';

class project_browe extends StatefulWidget {
  @override
  _project_broweState createState() => _project_broweState();
}

class _project_broweState extends State<project_browe> {
  Color color1 = Color.fromRGBO(237, 183, 74, 1);
  Color color2 = Color.fromRGBO(11, 71, 111, 1);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              child: Text("Browse Projects",style: TextStyle(fontSize: 30,letterSpacing: 2.5,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ),
           Container(
             height: height,
             padding: EdgeInsets.only(top: width*0.15),
             decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(topRight: Radius.circular(40))
             ),
             child: Consumer<artisans_provider>(builder: (context, pr, child) {
              return ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, int i) {
                    return Center(
                        child: projectcardbrowse(
                            context,
                            "${pr.projects[i]['title']}",
                            "${pr.projects[i]['description']}",
                            "0","nabil","null",i
                        //    "${pr.userinfo[i]['first_name']}",
                          //  "${pr.userinfo[i]['profile_pic']}",i
                        ));
                  },
                  separatorBuilder: (context, int i) {
                    return SizedBox(
                      height: width * 0.04,
                    );
                  },
                  itemCount: pr.projects.length
              );
          }),
           )
        ],
      ),
    );
  }
}



projectcardbrowse(BuildContext context, String title, String des,
    String entries, String name, String image,int index) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  Color color2 = Color.fromRGBO(11, 71, 111, 1);
  Color color1 = Color.fromRGBO(237, 183, 74, 1);
  return Consumer<artisans_provider>(builder: (context , pr , child){
    return GestureDetector(
      onTap: ()async{
        await pr.getindex(index) ;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>artproject()));
      },
      child: Center(
        child: Container(
          width: width * 0.95,
          height: width * 0.3,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(30)),
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
              ]),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                      child: image == 'null' ? Container(
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
              ),
              Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.all(width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$title",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Colors.black87),
                        ),
                        Container(
                          height: width * 0.14,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              "$des",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                  color: Colors.black45),
                            ),
                          ),
                        ),
                        Text(
                          "Entries : $entries",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  });

}

