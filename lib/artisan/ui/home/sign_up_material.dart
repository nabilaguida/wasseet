import 'package:flutter/material.dart';


Color color1 = Color.fromRGBO(237,183,74, 1);
Color color2 = Color.fromRGBO(50,50,150, 1);
Color color3 = Color.fromRGBO(50,120,150, 1);
List<BoxShadow> costumShadow = [
  BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: -2,
      offset: Offset(-5,-5),
      blurRadius:20
  ),
  BoxShadow(
      color: Colors.black.withOpacity(.2),
      spreadRadius: 1,
      offset: Offset(3,3),
      blurRadius: 10
  ),

];

List<BoxShadow> costumShadow2 = [
  BoxShadow(
      color: Colors.red.withOpacity(0.5),
      spreadRadius: 2,
      offset: Offset(0,5),
      blurRadius:20
  ),
  BoxShadow(
      color: Colors.red.withOpacity(0.5),
      spreadRadius: 2,
      offset: Offset(0,20),
      blurRadius: 20
  ),

];






Widget commentcard(String image,String name,String address,String comment,
    BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: costumShadow,
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    width: MediaQuery.of(context).size.width-30,
    child: Column(

      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 25,
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
                        style: TextStyle(
                            fontSize: 16,
                          color: Colors.grey[800]
                        ),
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
                            fontFamily: "Montserrat-Light.ttf",
                              fontSize:14
                          ),
                        ),
                      ),
                    ),



                  ],
                ),
              ),

              SizedBox(width: 10),

            ],

          ),
        ),

      ],

    ),
  );
}


Widget offercard(String image,String name,String category,bool isblack ,
    BuildContext context) {
  return Container(

    clipBehavior: Clip.hardEdge,
    height: MediaQuery
        .of(context)
        .size
        .height / 7.3,

    decoration: BoxDecoration(

      border: Border(bottom: BorderSide(
          color: isblack ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
          width: 1.5)),
      color: isblack ?  Colors.grey[300].withOpacity(0.2) : Colors.grey.withOpacity(.15),

    ),
    child: Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [


        CircleAvatar(
          backgroundImage: AssetImage(
              image),
          radius: 22,
        ),

        SizedBox(width: 15),


        Column(

          crossAxisAlignment: CrossAxisAlignment
              .start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              name,
              style: TextStyle(
                  fontFamily: "",
                  color:isblack ? Colors.white.withOpacity(0.8) : Colors.grey[700] ,
                  fontWeight: FontWeight.w600,
                  fontSize: 17
              ),
            ),


            Text(
             category,
              style: TextStyle(

                  fontFamily: "",
                  color:isblack ? Colors.white.withOpacity(0.6) : Colors.grey[500],
                  fontSize: 13
              ),
            ),

          ],
        ),

        SizedBox(width: 25),

        Row(

          children: [

            GestureDetector(
              onTap: () {

              },
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 22,
                width: MediaQuery
                    .of(context)
                    .size
                    .height / 22,

                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color:isblack ? Colors.lightBlueAccent.withOpacity(.9) :Colors.blue.withOpacity(0.7)

                  ),
                  shape: BoxShape.circle,

                ),
                child: Icon(Icons.done,
                  color: isblack ? Colors.lightBlueAccent.withOpacity(.9) :Colors.blue.withOpacity(0.7),
                  size: MediaQuery
                      .of(context)
                      .size
                      .height / 28,),
              ),
            ),

            SizedBox(width: 9),

            GestureDetector(
              onTap: () {

              },
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 22,
                width: MediaQuery
                    .of(context)
                    .size
                    .height / 22,

                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: isblack ? Colors.white
                          .withOpacity(0.4) : Colors.grey[500]
                  ),
                  shape: BoxShape.circle,

                ),
                child: Icon(Icons.close,
                    color: isblack ? Colors.white.withOpacity(
                        0.4) : Colors.grey[500], size: MediaQuery
                        .of(context)
                        .size
                        .height / 28),
              ),
            ),

          ],

        )

      ],

    ),
  );
}

Widget homeCard(IconData icon,String title,
    BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return  Container(
    width: width*0.41,
    height: width*0.405,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
    ),
    child: Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Expanded(
          flex: 4,
            child: Container(
                alignment:Alignment.bottomCenter ,
                child: Icon(icon,color: color1,size: width*0.15)
            )
        ),

        Expanded(
          flex: 3,
          child: Container(

            width: width*0.33,

            child: Center(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[500],fontSize: width*0.050,fontWeight: FontWeight.w600,letterSpacing: 0.2)
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget projectCard(IconData icon,String title,
    BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return  Container(
    width: width*0.41,
    height: width*0.405,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
    ),
    child: Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Expanded(
            flex: 4,
            child: Container(
                alignment:Alignment.bottomCenter ,
                child: Icon(icon,color: color1,size: width*0.15)
            )
        ),

        Expanded(
          flex: 3,
          child: Container(

            width: width*0.33,

            child: Center(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[500],fontSize: width*0.050,fontWeight: FontWeight.w600,letterSpacing: 0.2)
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
