import 'package:common_test1/controllers/authcontroller.dart';
import 'package:common_test1/screens/homepage.dart';
import 'package:common_test1/screens/login.dart';
import 'package:common_test1/screens/SignUP.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthController.instance.auth.authStateChanges().listen((user) {

      print(
        'uid:${user?.uid}'
      );


    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(

        stream: AuthController.instance.auth.authStateChanges(),
        builder: (context, snapshot) {

      if(snapshot.connectionState==ConnectionState.active){
        final User? user =snapshot.data;


        if(user==null){

          return LoginWidget();


        }


        return HomePage();




      }
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );


    }
    );

  }
}
