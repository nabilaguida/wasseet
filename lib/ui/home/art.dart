import 'package:brikoula/providers/home_provider.dart';
import 'package:brikoula/ui/home/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class art extends StatefulWidget {
  @override
  _artState createState() => _artState();
}

class _artState extends State<art> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var art = Provider.of<home_provider>(context) ;
    return Scaffold(
      backgroundColor:  Color(int.parse('${art.decoration[0]['color']}')).withOpacity(0.7),
        body:
        ListView(
//          shrinkWrap: true,
//          physics: ScrollPhysics(),
          children: [
            Container(
              height: height * 0.25,
              color: Color(int.parse('${art.decoration[0]['color']}')).withOpacity(0.2),
              child: Stack(
                children: [
                  Positioned(
                    bottom: height * 0.15,
                    left: width * 0.7,
                    child: Container(
                      height: height * 0.25,
                      width: height * 0.25,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Positioned(
                    top: height * 0.2,
                    left: width * 0.7,
                    child: Container(
                      height: height * 0.1,
                      width: height * 0.1,
                      decoration: BoxDecoration(
                          color: Color(int.parse('${art.decoration[0]['color']}')),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Positioned(
                    top: height * 0.005,
                    right: width * 0.8,
                    child: Container(
                      height: height * 0.15,
                      width: height * 0.15,
                      decoration: BoxDecoration(
                          color: Color(int.parse('${art.decoration[0]['color']}')).withOpacity(0.4),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Container(
                    width: width,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: width * 0.4,
                      height: width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(30)),
                      ),
                      child: Container(
                        height: height * 0.097,
                        width: height * 0.097,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(int.parse('${art.decoration[0]['color']}')),
                              Color(int.parse('${art.decoration[0]['color']}')).withOpacity(0.5)
                            ]),
                            borderRadius: BorderRadius.all(
                                Radius.circular(30))),
                        child: Center(
                          child: Image.network(
                            "${art.decoration[0]['icon']}",
                            color: Colors.white,
                            width: width * 0.25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: width * 0.16,
                    alignment: Alignment.bottomCenter,
                    child: Text("${art.decoration[0]['ctr_name']}"
                      ,style: TextStyle(
                          fontSize: 18
                          ,color: Colors.white,
                          letterSpacing: 1.5
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: width,
                      height: width * 0.12,
                      child: Container(
                        width: width*0.16,
                        height: height*0.05,
                        child: Center(
                          child: IconButton(
                            onPressed: ()=>Navigator.of(context).pop(),
                            icon: Icon(Icons.arrow_back,color: Colors.white,),
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: width * 0.1),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(45),
                        topLeft: Radius.circular(45))),
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, int i) {
                      return khadam(
                        context,
                        "${art.artisans[i]['full_name']}",
                        "${art.artisans[i]['address']}",
                        "${art.ids[i]}",
                        i,"${art.artisans[i]['profile_pic']}",Color(int.parse("${art.decoration[0]['color']}")),art.artisans[i]['avillable']
                      );
                    },
                    separatorBuilder: (context, int i) {
                      return SizedBox(
                        height: width * 0.04,
                      );
                    },
                    itemCount: art.artisans.length)
            ) ],
        )
    );
  }
}

Widget khadam(BuildContext context, String fullname, String ad,String khadam_id,int i, String profile_pic,Color clr,bool avillable) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return  Consumer<home_provider>(builder: (context,art,child){
    return GestureDetector(
      onTap: (){
        print("22222222222222222222222222222222");
        art.comments.clear();
       // print("$khadam_id") ;
        art.getkhadam_id(khadam_id, i) ;
        art.getcomments() ;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_Page())) ;
      },
      child: Center(
        child: Container(
          width: width * 0.95,
          height: width * 0.27,
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
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 6,
                child: Center(
                  child:profile_pic == "" ? Container(
                    height: width * 0.15,
                    width: width * 0.15,
                    decoration: BoxDecoration(
                      color: clr.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Text("${fullname[0].toUpperCase()}",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w800),),),
                  ):Container(
                    height: width * 0.15,
                    width: width * 0.15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "$profile_pic")),
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  )
                ),
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
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        '$ad',
                        style: TextStyle(
                          height: 1.1,
                          fontSize: 14,
                          color: Colors.black45,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(height: height * 0.005),
                      avillable == true ?  Row(
                        children: [
                          Container(
                            height: width * 0.03,
                            width: width * 0.03,
                            decoration: BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            'Available',
                            style: TextStyle(
                              fontFamily: '',
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ):Row(
                        children: [
                          Container(
                            height: width * 0.03,
                            width: width * 0.03,
                            decoration: BoxDecoration(
                                color: Colors.red[400], shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            'Not available',
                            style: TextStyle(
                              fontFamily: '',
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  });

}
