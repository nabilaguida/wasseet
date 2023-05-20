import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'dettails.dart';

class ecommerce_home extends StatefulWidget {
  @override
  _ecommerce_homeState createState() => _ecommerce_homeState();
}

class _ecommerce_homeState extends State<ecommerce_home> {
  bool closed = true;
  Color secondary = Color.fromRGBO(233, 196, 106, 1);
  Color primary = Color.fromRGBO(19, 36, 40, 1);
  int selectedindexrow = 0;
  int selectedroom = 0;
  List<String> produits = [
    "Dale de sole",
    "Faience",
    "Pienture",
    "Decore",
    "Lumiere",
    "Constructions materieaux"
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Container(
          height: height * 0.34,
          child: Stack(
            children: [
              Container(
                height: height*0.2,
               decoration: BoxDecoration(
                   gradient: LinearGradient(colors: [
                     Color.fromRGBO(229, 170, 57, 1),
                     Color.fromRGBO(229, 170, 57, 0.8)
                   ]),
                 borderRadius: BorderRadius.only(
                   bottomRight: Radius.circular(45),
                   bottomLeft: Radius.circular(45)
                 )
               ),
              ),
              Positioned(
                top: height*0.08,
                child: Container(
                  width: width,
                  child: Center(
                    child: Container(
                      width: width * 0.9,
                      height: height * 0.23,
                      child: Container(
                          width: width * 0.9,
                          height: height * 0.23,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(229, 170, 57, 1).withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 5,
                                          child: Center(
                                              child: Text(
                                                "Get more help from \n Our team",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey[100],
                                                    fontWeight: FontWeight.w600),
                                              ))),
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: SizedBox(),
                                              ),
                                              Expanded(
                                                flex: 14,
                                                child: Container(
                                                  child: Center(
                                                    child: Text(
                                                      "visit us",
                                                      style: TextStyle(
                                                          letterSpacing: 1,
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.black87),
                                                    ),
                                                  ),
                                                  height: height * 0.06,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[100],
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(20))),
                                                ),
                                              ),
                                              Expanded(flex: 1, child: SizedBox()),
                                              Expanded(
                                                flex: 6,
                                                child: Container(
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.call,
                                                      size: 25,
                                                      color: Colors.grey[100],
                                                    ),
                                                  ),
                                                  height: height * 0.06,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey[100],
                                                          width: 2),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(20))),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: SizedBox(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: Image.asset(
                                    "images/create@182x.png",
                                    height: height * 0.12,
                                    width: height * 0.12,
                                  ),
                                ),
                              )
                            ],
                          )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://i.pinimg.com/originals/ff/f5/28/fff528241add3145ad86720e7c7720f7.jpg"),
                          fit: BoxFit.fill,
                        ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1),
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1)
                  ]
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  height: height * 0.08,
                  child: Center(child: Text("Discover",style: TextStyle(fontSize: 25,letterSpacing: 1,color: Colors.black54,fontWeight: FontWeight.w600),))
              ),
            ],
          )
        ),
        Container(
          height: height * 0.08,
          child: ListView.builder(
            itemCount: produits.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedindexrow = index;
                  });
                },
                child: Center(
                  child: Container(
                    height: height * 0.05,
                    decoration: selectedindexrow == index
                        ? BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(229, 170, 57, 1),
                              Color.fromRGBO(229, 170, 57, 0.8)
                            ])
                    )
                        : BoxDecoration(),
                    child: Center(
                      child: Text(
                        "  ${produits[index]}  ",
                        style: selectedindexrow == index
                            ? TextStyle(color: Colors.white)
                            : TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[400]),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        GridView.builder(
          itemCount: 20,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0),
          itemBuilder: (context, index) {
            return Container(
              child: Center(
                child: Container(
                  height: height * 0.28,
                  width: width * 0.42,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-1, -1),
                            blurRadius: 8,
                            spreadRadius: 10),
                        BoxShadow(
                            color: Colors.grey[100],
                            offset: Offset(1, 1),
                            blurRadius: 8,
                            spreadRadius: 10)
                      ]),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                            child: Center(
                                child: Image.asset(
                          "images/PngItem_3503598.png",
                          height: height * 0.14,
                                  width: width *0.35,
                        ))),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Column(
                            children: [
                              Text('Sapient Gleelak',style: TextStyle(
                                  fontWeight: FontWeight.w600,letterSpacing: 1,fontSize: 16
                              ),),
                              Row(
                                children: [
                                  Expanded(
                                    flex : 2,
                                    child: SizedBox(),
                                  ),
                                  Expanded(flex : 3 ,child: Text("Likes",style : TextStyle(color: Colors.grey[600]))),
                                  Expanded(flex : 1 ,child: Icon(Icons.favorite_border,color: Colors.grey[600],)),
                                  Expanded(flex : 2 ,child: Text("12k",style : TextStyle(color: Colors.grey[600]))),
                                  Expanded(
                                    flex : 2,
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height*0.02,
                              ),
                              Text('800 Da',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: 1,fontSize: 18),),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
