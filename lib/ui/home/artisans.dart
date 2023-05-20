//import 'package:brikoula/providers/home_provider.dart';
//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:provider/provider.dart';
//class artisans extends StatefulWidget {
//  @override
//  _artisansState createState() => _artisansState();
//}
//
//class _artisansState extends State<artisans> {
//  Color color1 = Colors.pinkAccent.shade200;
//  @override
//  Widget build(BuildContext context) {
//    final height = MediaQuery.of(context).size.height;
//    final width = MediaQuery.of(context).size.width;
//    return Scaffold(
//      backgroundColor: Colors.pink[300],
//      body: Consumer<home_provider>(builder: (context ,art,child){
//       return NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             FutureBuilder(
//                 future: FirebaseFirestore.instance.collection("categories").doc('${art.color}').get(),
//                 builder: (context, snapshot) {
//                   if(snapshot.hasData){
//                     Map<String, dynamic> data = snapshot.data.data();
//                     return SliverAppBar(
//                       centerTitle: true,
//                       title: Text("${art.category}",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16.0,
//                               letterSpacing: 2)),
//                       backgroundColor: Colors.green.withOpacity(0.5),
//                       leading: IconButton(
//                         color: Colors.white,
//                         icon: Icon(Icons.arrow_back),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                       expandedHeight: height * 0.25,
//                       floating: true,
//                       pinned: true,
//                       flexibleSpace: FlexibleSpaceBar(
//                           centerTitle: true,
//                           background: Container(
//                             color: Colors.pink[300],
//                             child: Stack(
//                               children: [
//                                 Positioned(
//                                   bottom: height * 0.15,
//                                   left: width * 0.7,
//                                   child: Container(
//                                     height: height * 0.25,
//                                     width: height * 0.25,
//                                     decoration: BoxDecoration(
//                                         color: Colors.white.withOpacity(0.2),
//                                         shape: BoxShape.circle),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: height * 0.25,
//                                   left: width * 0.7,
//                                   child: Container(
//                                     height: height * 0.1,
//                                     width: height * 0.1,
//                                     decoration: BoxDecoration(
//                                         color: Colors.pink[400],
//                                         shape: BoxShape.circle),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: height * 0.05,
//                                   right: width * 0.8,
//                                   child: Container(
//                                     height: height * 0.15,
//                                     width: height * 0.15,
//                                     decoration: BoxDecoration(
//                                         color: Colors.pink[600],
//                                         shape: BoxShape.circle),
//                                   ),
//                                 ),
//                                 Column(
//                                   children: [
//                                     SizedBox(
//                                       height: width*0.1,
//                                     ),
//                                     Container(
//                                       width: width,
//                                       child: Center(
//                                         child: Container(
//                                           width: width*0.4,
//                                           height: width*0.42,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.all(Radius.circular(30)),
//                                           ),
//                                           child:Container(
//                                             height: height * 0.097,
//                                             width: height * 0.097,
//                                             decoration: BoxDecoration(
//                                                 gradient: LinearGradient(
//                                                     colors: [Colors.pink, Colors.pink.withOpacity(0.5)]),
//                                                 borderRadius: BorderRadius.all(Radius.circular(30))),
//                                             child: Center(
//                                               child: Image.network(
//                                                 "https://firebasestorage.googleapis.com/v0/b/brikoola-ef2b4.appspot.com/o/categories%2Felectricien.gif?alt=media&token=2a97d07c-a637-485d-b0fa-7b427d206a32"                                        ,
//                                                 color: Colors.white,
//                                                 width: width * 0.25,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           )),
//                     );
//                   }
//                  return Text("loading");
//                 }
//             ),
//           ];
//         },
//         body :  Container(
//           alignment: Alignment.topCenter,
//           decoration: BoxDecoration(
//               color: Colors.grey[100],
//               borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(45), topLeft: Radius.circular(45))),
//           child: FutureBuilder(
//               future: FirebaseFirestore.instance.collection("${art.category}").get(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return Text("Something went wrong");
//                 }
//                 if(snapshot.hasData){
//                   return ListView.separated(
//                     shrinkWrap: true, physics: ScrollPhysics(),
//                     scrollDirection: Axis.vertical,
//                     itemCount: 10,
//                     itemBuilder: (context ,int index){
//                       return khadam(context);
//                     },
//                     separatorBuilder: (context ,index){
//                       return SizedBox(
//                         height: height*0.02,
//                       );
//                     },
//                   ) ;
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//
//                 return Text("loading");
//
//               }
//           ),
//         ),
//       );
//      })
//
//    );
//  }
//}
//
//Widget khadam (BuildContext context){
//  final height = MediaQuery.of(context).size.height;
//  final width = MediaQuery.of(context).size.width;
//  return Center(
//    child: Container(
//      width: width*0.9,
//      height: width*0.3,
//      decoration: BoxDecoration(
//          color: Colors.grey[100],
//          borderRadius: BorderRadius.all(Radius.circular(30)),
//          boxShadow: [
//            BoxShadow(
//                color: Colors.white,
//                offset: Offset(-4,-4)
//                ,blurRadius: 15,
//                spreadRadius: 1
//            ),
//            BoxShadow(
//                color: Colors.grey[400],
//                offset: Offset(4,4)
//                ,blurRadius: 15,
//                spreadRadius: 1
//            )
//          ]
//      ),
//      child: Row(
//        children: [
//          Expanded(
//            flex: 2,
//            child: Center(
//              child: Container(
//                height: width *0.18,
//                width: width *0.18,
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    fit: BoxFit.fill,
//                    image: NetworkImage("https://lh3.googleusercontent.com/ogw/ADGmqu9iWvBqHtS-SSJvKn5q7SIJmTQz-OCHXR4DMrhgmQ=s64-c-mo")
//                  ),
//                  color: Colors.green,
//                  shape: BoxShape.circle,
//                ),
//              ),
//            ),
//          ),
//          Expanded(
//            flex:7,
//            child: Container(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                  Text('Aguida mohamed nabil',style: TextStyle(
//                    fontWeight: FontWeight.w500,
//                    letterSpacing: 1,
//                    color: Colors.black87,
//                  ),),
//                  Text('Aguida mohamed nabil',style: TextStyle(
//                    fontWeight: FontWeight.w500,
//                    letterSpacing: 1,
//                    color: Colors.black87,
//                  ),),
//                ],
//              ),
//            ),
//          ),
//          Expanded(
//            flex: 2,
//            child: Container(
//              child: Column(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [
//                  SizedBox(
//                    height: height*0.02,
//                  ),
//                  Expanded(
//                    child: Container(
//                     child: Center(
//                        child: Container(
//                          height: width *0.09,
//                          decoration: BoxDecoration(
//                            border: Border.all(
//                              width: 1
//                            ),
//                            shape: BoxShape.circle
//                          ),
//                          child: Center(
//                            child: Icon(Icons.add),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    child: Container(
//                      child: Center(
//                        child: Container(
//                          height: width *0.09,
//                          decoration: BoxDecoration(
//                              border: Border.all(
//                                  width: 1
//                              ),
//                              shape: BoxShape.circle
//                          ),
//                          child: Center(
//                            child: Icon(Icons.chat_outlined,size: 20,),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                  SizedBox(
//                    height: height*0.02,
//                  ),
//                ],
//              ),
//            ),
//          )
//        ],
//      ),
//    ),
//  );
//}
