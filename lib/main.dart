import 'package:brikoula/artisan/providers/artisans_provider.dart';
import 'package:brikoula/artisan/providers/signup.dart';
import 'package:brikoula/providers/home_provider.dart';
import 'package:brikoula/providers/project_provider.dart';
import 'package:brikoula/providers/signup.dart';
import 'package:brikoula/test.dart';
import 'package:brikoula/ui/home/btm_nav_bar.dart';
import 'package:brikoula/ui/home/client_profile_page.dart';
import 'package:brikoula/ui/home/home.dart';
import 'package:brikoula/ui/home/myprojects.dart';
import 'package:brikoula/ui/home/project_Page_Client.dart';
import 'package:brikoula/ui/home/projetct_creation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './auth/mobile.dart';
import 'artisan/ui/auth/sign_up1.dart';
import 'artisan/ui/home/artproject.dart';
import 'artisan/ui/home/project_browsing.dart';
import 'auth/signup.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>signupprovider(),),
        ChangeNotifierProvider(create: (context)=>signupproviderart(),),
        ChangeNotifierProvider(create: (context)=>home_provider(),),
        ChangeNotifierProvider(create: (context)=>projectProvider(),),
        ChangeNotifierProvider(create: (context)=>artisans_provider(),),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          home: InitializerWidget()),
    );
  }
}

class InitializerWidget extends StatefulWidget {
  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {

  FirebaseAuth _auth;

  User _user;

  bool isLoading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ) : _user == null ? LoginScreen() : Example();
  }
}