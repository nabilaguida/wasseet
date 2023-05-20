import 'package:flutter/material.dart' ;
import 'package:cloud_firestore/cloud_firestore.dart';

class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  var categories =  FirebaseFirestore.instance.collection("categories") ;
  List list = [] ;
  getData()async{
    var repo = await categories.get() ;
    repo.docs.forEach((element) {
      setState(() {
        list.add(element.data()['ctr_name']) ;
      });
    });
    print(list) ;
  }
  @override
  void initState() {
    getData() ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body: Container(
//        child: ListView.builder(
//            itemCount: list.length,
//            itemBuilder: (context,int i){
//          if(list.isNotEmpty){
//            return Text("${list[i]['ctr_name']}") ;
//          }else{
//            return Center(
//              child: CircularProgressIndicator(),
//            );
//          }
//        }),
   //   ),
      body:  FutureBuilder(
        future: categories.get(),
        builder:
            (context,  snapshot) {

          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData ) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                  itemBuilder: (context , int i){
                    return Text("${snapshot.data.docs[i].data()['ctr_name']}");
                  },
                  separatorBuilder: (context,int i){
                    return SizedBox(
                      height: 50,
                    );
                  },
                  itemCount: snapshot.data.docs.length),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return Text("loading");
        },
      )
    );
  }
}
//

