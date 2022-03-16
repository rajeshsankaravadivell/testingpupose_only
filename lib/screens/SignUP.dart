import 'package:common_test1/controllers/authcontroller.dart';
import 'package:common_test1/screens/SignUP.dart';
import 'package:common_test1/screens/landingpage.dart';
import 'package:common_test1/screens/login.dart';
import 'package:common_test1/themeconstants.dart';
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
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;
  TextEditingController? passwordTextController1;
  bool? passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordTextController1 = TextEditingController();
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
                                      child: TextFormField(
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

                                     if(passwordTextController!.text==passwordTextController1!.text){

                                       await AuthController.instance.auth.SignUpWithEmail(emailTextController!.text, passwordTextController!.text);
                                       Get.off(()=>LandingPage());
                                     }
                                     else
                                       return print('Password Missmatch');

                                        if (kDebugMode) {
                                          print(AuthController
                                              .instance.auth.currentUser!.uid);
                                        }
                                      },
                                      child: const Text('SignUp'),
                                    )),
                                Text(
                                  'Forgot password?',
                                  style: GoogleFonts.getFont(
                                    'Open Sans',
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 12, 0, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          height: 38,
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        -0.7, -0.01),
                                                child: Container(
                                                  width: 18,
                                                  height: 18,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png?w=512&h=512',
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                  onPressed: () async {
                                                    await AuthController
                                                        .instance.auth
                                                        .signInWithGoogle();
                                                  },
                                                  child: const Text('google')),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 0, 0, 0),
                                          child: SizedBox(
                                            width: 100,
                                            height: 38,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -0.7, -0.01),
                                                  child: Container(
                                                    width: 18,
                                                    height: 18,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {},
                                                    child:
                                                        const Text('google')),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 10, 0),
                                        child: Text(
                                          'Don\'t have an account?',
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: const Color(0xFFADADAD),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginWidget()));
                                        },
                                        child: Text(
                                          'SignUp',
                                          style: getText(context)
                                              .button
                                              ?.apply(color: Colors.lightBlue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
