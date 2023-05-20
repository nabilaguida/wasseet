import 'package:brikoula/artisan/ui/auth/sign_up1.dart';
import 'package:brikoula/auth/signup.dart';
import 'package:flutter/material.dart';

class User_Type extends StatefulWidget {
  @override
  _User_TypeState createState() => _User_TypeState();
}

class _User_TypeState extends State<User_Type> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Color color1 = Color.fromRGBO(237, 183, 74, 1);
    Color color2 = Color.fromRGBO(11, 90, 121, 1).withAlpha(150);
    Color color3 = Color.fromRGBO(11, 155, 141, 1);

    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(children: [
          SizedBox(
            height: width *0.2,
          ),
          Expanded(
            flex: 2,
            child: Container(
                child: Center(
                  child: Image.asset(
                    "images/applogo.png",
                  ),
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: width * 0.9,
              child: Center(
                child: Text(
                  'What type of user are you?',
                  style:
                  TextStyle(fontSize: 20, color: Colors.grey[800]),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                width: width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected1 = !isSelected1;
                          if (isSelected2 == true)
                            isSelected2 = !isSelected2;
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          child: Container(
                            width: width * 0.42,
                            height: width * 0.55,
                            decoration: isSelected1
                                ? BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30))
                                : BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                Container(
                                    width: 100,
                                    height: 100,
                                    child:
                                        Image.asset('images/client.png')),
                                SizedBox(height: 10),
                                Text(
                                  'Client',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: isSelected1
                                          ? color1
                                          : Colors.black87),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'search for services',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: '',
                                    fontSize: 13,
                                    color: isSelected1
                                        ? color1
                                        : Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected2 = !isSelected2;
                          if (isSelected1 == true)
                            isSelected1 = !isSelected1;
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          child: Container(
                            width: width * 0.42,
                            height: width * 0.55,
                            decoration: isSelected2
                                ? BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30))
                                : BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(30),
                                  ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                Container(
                                    width: 100,
                                    height: 100,
                                    child:
                                        Image.asset('images/artisan.png')),
                                SizedBox(height: 10),
                                Text(
                                  'Artisan',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: isSelected2
                                          ? color1
                                          : Colors.black87),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'provide services',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: '',
                                    fontSize: 13,
                                    color: isSelected2
                                        ? color1
                                        : Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  if(isSelected1 == true){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signup()));
                  }
                  if(isSelected2 == true){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sign_up1()));
                  }

                },
                child: Container(
                  width: width * 0.9,
                  height: width * 0.12,
                  decoration: BoxDecoration(
                      color: color1,
                      borderRadius:
                      BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text("Next"),
                  ),
                ),
              ),
            ),
          ),
          Expanded(flex: 1, child: SizedBox()),
        ]));
  }
}
