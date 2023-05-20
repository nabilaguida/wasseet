import 'package:brikoula/artisan/ui/home/home_art.dart';
import 'package:brikoula/auth/signup.dart';
import 'package:brikoula/auth/user_Type.dart';
import 'package:brikoula/providers/signup.dart';
import 'package:brikoula/ui/home/btm_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  Color color1 = Color.fromRGBO(233, 196, 106, 1);
  String text = "";
  String type = "" ;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  bool exist = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  List phones =[];
  String verificationId;
  String tel = "";
  bool showLoading = false;

  void signInWithPhoneAuthCredential(

      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    await FirebaseFirestore.instance.collection('signedup').get().then((value) {
      value.docs.forEach((element) {
        phones.add(element.id) ;
        print("==================");
      });
      if(phones.contains(tel)){
        exist = true ;
      }
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });
      print(exist);
      if (authCredential?.user != null && exist == true) {
        await FirebaseFirestore.instance.collection('signedup').doc('$tel').get().then((value) {
          type = value.data()['type'];
        });
        if(type == "client"){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Example()));
        }
        if(type == "artisan"){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home_art()));
        }

      } else {
        if (authCredential?.user != null && exist == false) {

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => User_Type()));
         phones.add(tel) ;

        }
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  getMobileFormWidget(context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: height*0.15,
            ),
            Center(
              child: Image.asset("images/wasseet.png",height: width*0.3,),
            ),
            SizedBox(
              height: height*0.05,
            ),
            Center(
              child: Text("Sign in.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w800)),
            ),
            Center(
              child: Text("Enter your phone \nnumber",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, letterSpacing: 1.5)),
            ),
            SizedBox(
              height: width * 0.2,
            ),
            Container(
              width: width * 0.9,
              height: width * 0.12,
              child: Center(
                  child: Row(
                children: [
                  Container(
                    width: width * 0.2,
                    child: Center(
                      child: Text("+213"),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      style: TextStyle(color: Colors.grey[800], letterSpacing: 1),
                      decoration: InputDecoration(
                        labelText: 'Phone number',
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
                ],
              )),
            ),
            SizedBox(
              height: width * 0.06,
            ),
            showLoading
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(color1),
                    ),
                  )
                : Consumer<signupprovider>(
              builder: (context,signup,child){
                return GestureDetector(
                  onTap: () async {
                    if (phoneController.text[0] == "0") {
                      tel = phoneController.text.replaceFirst("0", "+213");
                    } else {
                      setState(() {
                        tel = "+213${phoneController.text.toString()}";
                      });
                    }
                    print(tel);
                    signup.getuserphone(tel) ;
                    print("0000000000000000000000000000");
                    setState(() {
                      showLoading = true;
                    });
                    await _auth.verifyPhoneNumber(
                      phoneNumber: tel,
                      verificationCompleted: (phoneAuthCredential) async {
                        setState(() {
                          showLoading = false;
                        });
                        //signInWithPhoneAuthCredential(phoneAuthCredential);
                      },
                      verificationFailed: (verificationFailed) async {
                        setState(() {
                          showLoading = false;
                        });
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content: Text(verificationFailed.message)));
                      },
                      codeSent: (verificationId, resendingToken) async {
                        setState(() {
                          showLoading = false;
                          currentState =
                              MobileVerificationState.SHOW_OTP_FORM_STATE;
                          this.verificationId = verificationId;
                        });
                      },
                      codeAutoRetrievalTimeout: (verificationId) async {},
                    );
                  },
                  child: Container(
                    width: width * 0.9,
                    height: width * 0.12,
                    decoration: BoxDecoration(
                        color: phoneController.text.length < 9
                            ? Colors.grey[300]
                            : color1,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text("Send"),
                    ),
                  ),
                );
              },
                ),
            Expanded(
              child: Container(
                width: width * 0.74,
                alignment: Alignment.bottomCenter,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "By connecting to weseet go and accept",
                        style: TextStyle(color: Colors.black87)),
                    TextSpan(
                        text: "\nTerms of use",
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w700)),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// .=======================Otp===============================================
  getOtpFormWidget(context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Image.asset(
          "images/otp.png",
          height: width * 0.3,
          width: width * 0.4,
        )),
        SizedBox(
          height: width * 0.1,
        ),
        Text(
          "Check your number",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: width * 0.04,
        ),
        Text(
          "A 4-6 digit code has been \n sent to your number",
          style: TextStyle(fontSize: 16, color: Colors.black45),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Container(
            width: width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                box(context, text.length == 0 ? "" : text[0]),
                box(context, text.length < 2 ? "" : text[1]),
                box(context, text.length < 3 ? "" : text[2]),
                box(context, text.length < 4 ? "" : text[3]),
                box(context, text.length < 5 ? "" : text[4]),
                box(context, text.length < 6 ? "" : text[5]),
              ],
            ),
          ),
        ),
        SizedBox(
          height: width * 0.1,
        ),
        showLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(color1),
                ),
              )
            : GestureDetector(
          onTap: () async {
            PhoneAuthCredential phoneAuthCredential =
            PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: text);
            print(text);
            signInWithPhoneAuthCredential(phoneAuthCredential);

          },
          child: Container(
            height: width * 0.12,
            width: width * 0.9,
            decoration: BoxDecoration(
                color: text.length < 6 ? Colors.grey[300] : color1,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(child: Text("Verify")),
          ),
        ),
        NumericKeyboard(
          onKeyboardTap: _onKeyboardTap,
          textColor: Colors.black54,
          rightButtonFn: () {
            setState(() {
              text = text.substring(0, text.length - 1);
            });
          },
          rightIcon: Icon(
            Icons.backspace,
            color: color1,
          ),
          leftButtonFn: () {
            print('left button clicked');
          },
        ),
      ],
    );
  }

  _onKeyboardTap(String value) {
    debugPrint("${text.length}");
    if (text.length < 6) {
      setState(() {
        text = text + value;
      });
    }
  }

  Widget box(BuildContext context, String text) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: width * 0.12,
      width: width * 0.12,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black87)),
      child: Center(
        child: Text(text),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
              ? getMobileFormWidget(context)
              : getOtpFormWidget(context),
        ));
  }
}
