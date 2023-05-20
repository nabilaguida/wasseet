import 'package:brikoula/providers/signup.dart';
import 'package:brikoula/ui/home/btm_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  Color color1 = Color.fromRGBO(233, 196, 106, 1);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: width*0.1,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: height*0.2,
                width: width,
                child: Icon(Icons.person,size: width*0.4,color: Colors.black54),
              ),
              Center(
                child: Text("Complete your profile.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w900)),
              ),
              SizedBox(
                height: width*0.03,
              ),
              Center(
                child: Text("Let's start by completing \n your profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
              ),
              SizedBox(
                height: width*0.05,
              ),
              Container(
                width: width*0.9,
                height: width*0.12,
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: firstname,
                  style: TextStyle(color: Colors.grey[800], letterSpacing: 1),
                  decoration: InputDecoration(
                    labelText: 'First name',
                    labelStyle:
                    TextStyle(color: Colors.grey[600], letterSpacing: 0.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey[400]),
                      borderRadius: BorderRadius.circular(width * 0.1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 3, color: color1.withOpacity(.7)),
                      borderRadius: BorderRadius.circular(width * 0.1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width*0.03,
              ),
              Container(
                width: width*0.9,
                height: width*0.12,
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: lastname,
                  style: TextStyle(color: Colors.grey[800], letterSpacing: 1),
                  decoration: InputDecoration(
                    labelText: 'last name',
                    labelStyle:
                    TextStyle(color: Colors.grey[600], letterSpacing: 0.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey[400]),
                      borderRadius: BorderRadius.circular(width * 0.1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 3, color: color1.withOpacity(.7)),
                      borderRadius: BorderRadius.circular(width * 0.1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width*0.03,
              ),
              Container(
                width: width*0.9,
                height: width*0.12,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  style: TextStyle(color: Colors.grey[800], letterSpacing: 1),
                  decoration: InputDecoration(
                    labelText: 'Email address',
                    labelStyle:
                    TextStyle(color: Colors.grey[600], letterSpacing: 0.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey[400]),
                      borderRadius: BorderRadius.circular(width * 0.1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 3, color: color1.withOpacity(.7)),
                      borderRadius: BorderRadius.circular(width * 0.1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width*0.06,
              ),
              Consumer<signupprovider>(builder: (context,signup,child){
                return GestureDetector(
                  onTap: ()async {
                    signup.Done(false) ;
                    String fullname = "${firstname.text.toString() +" "+ lastname.text.toString()}" ;
                    signup.getuserinfo(fullname, email.text.toString()) ;
                    signup.addUser() ;
                    await FirebaseFirestore.instance.collection('signedup').doc(signup.phone_number).set(
                        {
                          "type" : "client"
                        }
                    );
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Example())) ;
                  },
                  child: signup.done == true ? Container(
                    width: width * 0.9,
                    height: width * 0.12,
                    decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text("Next"),
                    ),
                  ): Container(
                    width: width*0.9,
                    height: height*0.12,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(color1),
                      ),
                    ),
                  ),
                );
              }),

              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
