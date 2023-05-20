import 'package:brikoula/artisan/providers/signup.dart';
import 'package:brikoula/artisan/ui/home/home_art.dart';
import 'package:brikoula/providers/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sign_up1 extends StatefulWidget {
  @override
  _Sign_up1State createState() => _Sign_up1State();
}

class _Sign_up1State extends State<Sign_up1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatpasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  var cat = FirebaseFirestore.instance.collection("categories");


  List<String> dropdown_cat = [];

  getcategories() async {
    var response = await cat.get();
    response.docs.forEach((element) {
     setState(() {
       dropdown_cat.add(element.data()['ctr_name']);
     });
    });
    print('====================================');
    print(dropdown_cat);
    print("**************************************");
    print(dropdown_cat.runtimeType);
  }

  String _selectedcat = "Building";
  @override
  void initState() {
    getcategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Color color1 = Color.fromRGBO(237, 183, 74, 1);
    Color color2 = Color.fromRGBO(11, 71, 111, 1);
    Color color3 = Color.fromRGBO(11, 155, 141, 1);
    var pro = Provider.of<signupprovider>(context) ;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Center(
          child: Container(
            width: width * 0.8,
            child: ListView(
              children: [
                SizedBox(height: width * 0.1),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Hello there',
                          style: TextStyle(
                            fontSize: width * 0.11,
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: width * 0.03),
                      Container(
                        child: Text(
                          'Fill in your information and confirm to continue sign up',
                          style: TextStyle(
                            fontSize: width * 0.05,
                            color: Colors.black54,
                            fontFamily: 'Montserrat-Light.ttf',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: width * 0.08),
                      Container(
                        width: width * 0.9,
                        height: width * 0.12,
                        child: Center(
                          child: TextField(
                            controller: emailController,
                            style: TextStyle(
                                color: Colors.grey[800], letterSpacing: 0.5),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: Colors.grey[600], letterSpacing: 0.5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey[400]),
                                borderRadius:
                                    BorderRadius.circular(width * 0.1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: color1.withOpacity(.7)),
                                borderRadius:
                                    BorderRadius.circular(width * 0.1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      Container(
                        width: width * 0.9,
                        height: width * 0.12,
                        child: Center(
                          child: TextField(
                            controller: nameController,
                            style: TextStyle(
                                color: Colors.grey[800], letterSpacing: 0.5),
                            decoration: InputDecoration(
                              labelText: 'Fullname',
                              labelStyle: TextStyle(
                                  color: Colors.grey[600], letterSpacing: 0.5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey[400]),
                                borderRadius:
                                    BorderRadius.circular(width * 0.1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: color1.withOpacity(.7)),
                                borderRadius:
                                    BorderRadius.circular(width * 0.1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      Container(
                        width: width * 0.9,
                        height: width * 0.12,
                        child: Center(
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            style: TextStyle(
                                color: Colors.grey[800], letterSpacing: 1),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.grey[600], letterSpacing: 0.5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey[400]),
                                borderRadius:
                                    BorderRadius.circular(width * 0.1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: color1.withOpacity(.7)),
                                borderRadius:
                                    BorderRadius.circular(width * 0.1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: width * 0.03),
                      Container(
                        width: width * 0.9,
                        height: width * 0.12,
                        child: Center(
                          child: TextField(
                            obscureText: true,
                            controller: repeatpasswordController,
                            style: TextStyle(
                                color: Colors.grey[800], letterSpacing: 1),
                            decoration: InputDecoration(
                              labelText: 'Repeat Password',
                              labelStyle: TextStyle(
                                  color: Colors.grey[600], letterSpacing: 0.5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey[400]),
                                borderRadius:
                                    BorderRadius.circular(width * 0.1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: color1.withOpacity(.7)),
                                borderRadius:
                                    BorderRadius.circular(width * 0.1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: width * 0.03),
                      Container(
                        width: width * 0.9,
                        height: width * 0.12,
                        child: Center(
                          child: TextField(
                            controller: addressController,
                            style: TextStyle(
                                color: Colors.grey[800], letterSpacing: 1),
                            decoration: InputDecoration(
                              labelText: 'Address',
                              labelStyle: TextStyle(
                                  color: Colors.grey[600], letterSpacing: 0.5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey[400]),
                                borderRadius:
                                    BorderRadius.circular(width * 0.1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: color1.withOpacity(.7)),
                                borderRadius:
                                    BorderRadius.circular(width * 0.1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: width * 0.03),
                      Container(
                        width: width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'select category',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: width * 0.05),
                            ),
                            Container(
                                width: width * 0.36,
                                height: width * 0.14,
                                child: DropdownButton(
                                  isExpanded: true,
                                  underline: Container(
                                    height: width * 0.002,
                                    color: Colors.black54,
                                  ),
                                  iconSize: width * 0.1,
                                  value: _selectedcat,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _selectedcat = newValue;
                                    });
                                  },
                                  items: dropdown_cat.map((String category) {
                                    return DropdownMenuItem(
                                        child: Text(
                                          category,
                                          style: TextStyle(
                                              fontSize: width * 0.045),
                                        ),
                                        value: category);
                                  }).toList(),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: width * 0.09),
                      Consumer<signupproviderart>(
                          builder: (context, signup, child) {
                        return GestureDetector(
                          onTap: () async{
                            signup.getuserinfo(
                                nameController.text,
                                emailController.text,
                                addressController.text,
                                "0672085937",
                                passwordController.text,
                                _selectedcat);
                            signup.addUser(_selectedcat);
                            signup.setartisansnb(_selectedcat);
                            await FirebaseFirestore.instance.collection('signedup').doc(pro.phone_number).set(
                                {
                                  "type" : "artisan"
                                }
                            );
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home_art()));
                          },
                          child: Container(
                            width: width * 0.9,
                            height: width * 0.12,
                            decoration: BoxDecoration(
                                color: color1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Text("Create account"),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
