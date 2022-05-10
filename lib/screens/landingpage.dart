import 'package:common_test1/controllers/myauthcontroller.dart';
import 'package:common_test1/main.dart';

import 'package:common_test1/screens/homepage.dart';
import 'package:common_test1/screens/login.dart';
import 'package:common_test1/screens/SignUP.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key, this.callback}) : super(key: key);

  final void Function()? callback;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: auth1.authStateChnages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;

            if (user == null) {
              return LoginWidget();
            }

            if (user.emailVerified) {
              if (widget.callback != null) {
                return HomePage(
                  callback: widget.callback!,
                );
              } else {
                return HomePage(
                  callback: () {},
                );
              }
            }
            if (user.emailVerified == false) {
              return ElevatedButton(
                  onPressed: () async {
                    await user.sendEmailVerification();
                    Get.to(auth1.signOut());
                  },
                  child: Text('verifyemail'));
            }
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
