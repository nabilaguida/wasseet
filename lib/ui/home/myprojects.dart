import 'package:brikoula/providers/project_provider.dart';
import 'package:brikoula/ui/home/project_Page_Client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class myprojects extends StatefulWidget {
  @override
  _myprojectsState createState() => _myprojectsState();
}

class _myprojectsState extends State<myprojects> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var mypro = Provider.of<projectProvider>(context);
    String projects = "" ;
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('projects').where('userid',isEqualTo: '${FirebaseAuth.instance.currentUser.uid}').get(),
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Colors.cyan,
          body: ListView(
            children: [
              Container(
                height: height * 0.15,
                width: width,
          color: Colors.cyan,
                child :Center(
                  child: Text("My Projects",style: TextStyle(fontSize: 35,letterSpacing: 2.5,fontWeight: FontWeight.bold,color: Colors.white),),
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
                  future: FirebaseFirestore.instance.collection('projects').where('userid',isEqualTo: '${FirebaseAuth.instance.currentUser.uid}').get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }
                    if (snapshot.hasData) {
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, int i) {
                            return projectcard(
                                context,
                                "${snapshot.data.docs[i].data()['title']}",
                                "${snapshot.data.docs[i].data()['description']}",
                                "${snapshot.data.docs[i].data()['entries']}",
                                "${snapshot.data.docs[i].data()['ctr_name'][0]}",i,snapshot.data.docs
                            );
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
    );
  }
}

projectcard(BuildContext context, String title, String des, String entries,
   String ctr_name,int index,List prjt) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Consumer<projectProvider>(builder: (context ,mypro,child){
    return  GestureDetector(
      onTap: ()async{
        await mypro.getmyprojects(prjt) ;
       mypro.getindex(index) ;
       mypro.getoffers() ;
       mypro.setlength() ;
       Navigator.push(context, MaterialPageRoute(builder: (context)=>project_client())) ;
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
                    child: Container(
                      width: width*0.18,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Text("${ctr_name[0].toString().toUpperCase()}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30,color: Colors.white),),
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
