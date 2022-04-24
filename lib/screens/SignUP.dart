import 'package:common_test1/controllers/authcontroller.dart';
import 'package:common_test1/controllers/myauthcontroller.dart';
import 'package:common_test1/screens/SignUP.dart';
import 'package:common_test1/screens/landingpage.dart';
import 'package:common_test1/screens/login.dart';
import 'package:common_test1/themeconstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    Key? key,
  }) : super(key: key);
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController emailTextController= TextEditingController();
  TextEditingController passwordTextController= TextEditingController();
  TextEditingController passwordTextController1= TextEditingController();
  bool? passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, -1),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  color: Colors.white,
                  child: Image.network(
                    'https://www.digisailor.com/assets/img/digisailorlogo.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0x00EEEEEE),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0, -0.65),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 34, 0, 12),
                                child: Image.network(
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/flutterflow_assets/ff_logo.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 20),
                                  child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE0E0E0),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 0),
                                      child: CustomTextformfield(emailTextController: emailTextController),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 4, 20),
                                  child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE0E0E0),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 0),
                                      child: TextFormField(
                                        controller: passwordTextController,
                                        obscureText: !passwordVisibility!,
                                        decoration: InputDecoration(
                                          hintText: 'Password',
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => passwordVisibility =
                                                  !passwordVisibility!,
                                            ),
                                            child: Icon(
                                              passwordVisibility!
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: const Color(0xFF455A64),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 4, 20),
                                  child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE0E0E0),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 0),
                                      child: TextFormField(
                                        controller: passwordTextController1,
                                        obscureText: !passwordVisibility!,
                                        decoration: InputDecoration(
                                          hintText: 'ConfirmPassword',
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => passwordVisibility =
                                                  !passwordVisibility!,
                                            ),
                                            child: Icon(
                                              passwordVisibility!
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: const Color(0xFF455A64),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                    child: ElevatedButton(
                                      onPressed: ()  async {

                                     if(passwordTextController.text==passwordTextController1.text)
                                     {


                                       try {
                                       await auth1.signUpwithEmail(emailTextController.text, passwordTextController.text);
                                       Get.to(LandingPage());
                                       } on FirebaseAuthException catch  (e) {
                                         print('Failed with error code: ${e.code}');
                                         print(e.message);


                                         showDialog<String>(
                                           context: context,
                                           builder: (BuildContext context) => AlertDialog(
                                             title:  Text(e.code.toString()),
                                             content:  Text(e.message.toString()),
                                             actions: <Widget>[
                                               TextButton(
                                                 onPressed: () => Navigator.pop(context, 'Cancel'),
                                                 child: const Text('Cancel'),
                                               ),
                                               TextButton(
                                                 onPressed: () => Navigator.pop(context, 'OK'),
                                                 child: const Text('OK'),
                                               ),
                                             ],
                                           ),
                                         );

                                       }
                                     

                                      // Get.to(LandingPage());


                                     }
                                     else
                                       return print('Password Missmatch');

                                        if (kDebugMode) {
                                          print(auth1.currentUser!.uid);
                                        }
                                      },
                                      child: const Text('SignUp'),
                                    )),
                                TextButton(onPressed: (){
                                  Get.to(()=>LoginWidget());
                                }, child: Text('Already Have account?'))

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextformfield extends StatelessWidget {
  const CustomTextformfield({
    Key? key,
    required this.emailTextController,
  }) : super(key: key);

  final TextEditingController emailTextController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailTextController,
      obscureText: false,
      decoration: const InputDecoration(
        hintText: 'Email',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
      ),
      style: GoogleFonts.getFont(
        'Open Sans',
        color: const Color(0xFF455A64),
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
