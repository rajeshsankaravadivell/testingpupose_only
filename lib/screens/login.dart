


import 'package:common_test1/controllers/authcontroller.dart';
import 'package:common_test1/models/authentication.dart';
import 'package:common_test1/screens/SignUP.dart';
import 'package:common_test1/screens/homepage.dart';
import 'package:common_test1/screens/landingpage.dart';
import 'package:common_test1/themeconstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:common_test1/controllers/authcontroller.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key,}) : super(key: key);



  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;
  bool?passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode =FocusNode();
  final _formKey= GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
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
                alignment: AlignmentDirectional(0, -1),
                child: Container(
                  height:MediaQuery.of(context).size.height*0.40,
                  color: Colors.white,
                  child: Image.network(
                    'https://www.digisailor.com/assets/img/digisailorlogo.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
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
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, -0.65),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 34, 0, 12),
                                  child: TextButton(onPressed: () {

                                    Get.to(()=>SignUpWidget());
                                  },
                                  child: Text('SignUp',style: getText(context).button?.apply(color: Colors.lightBlue),),


                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 20),
                                    child: Container(
                                      width: 300,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE0E0E0),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: TextFormField(
                                          validator:(value){
                                            if(value==null||value.isEmail){
                                              return 'Please check the field';
                                            }
                                          } ,
                                          controller: emailTextController,
                                          obscureText: false,
                                          autocorrect: false,
                                          textInputAction: TextInputAction.next,
                                          focusNode: _emailFocusNode,
                                          onEditingComplete: (){
                                            FocusScope.of(context).requestFocus(_passwordFocusNode);
                                          },

                                          decoration:  InputDecoration(



                                            hintText: 'Email@gmail.com',
                                        label: Text('Email'),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                              BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                              BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0xFF455A64),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 4, 20),
                                    child: Container(
                                      width: 300,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE0E0E0),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: TextFormField(
                                          validator:(value){
                                            if(value==null||value.isEmpty){
                                              return 'Please check the field';
                                            }
                                          } ,
                                          controller: passwordTextController,
                                          obscureText: !passwordVisibility!,
                                          focusNode: _passwordFocusNode,

                                          autocorrect: false,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(

                                            hintText: 'Password',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                              const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                              const BorderRadius.only(
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
                                            color: Color(0xFF455A64),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 20),
                                      child:ElevatedButton(
                                        style: ButtonStyle(

                                        ),

                                        onPressed: ()

                                        async {
                                          String title = '', message = '';


                                          if (_formKey.currentState!.validate()) {
                                            // If the form is valid, display a snackbar. In the real world,
                                            // you'd often call a server or save the information in a database.
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Processing Data')),
                                            );
                                          }

                                        try{

                                          await AuthController.instance.auth.SignUpWithEmail(emailTextController!.text, passwordTextController!.text);

                                        } on FirebaseAuthException catch  (e) {
                                           AlertDialog(
                                            content: const Text("Entered email is not present in our system"),
                                            title: const Text("Invalid Email-ID", style: TextStyle(color: Colors.black)),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Okay")),
                                            ],
                                          );

                                          print(e.message);
                                        }








                                        Get.off(()=>LandingPage());





                                      },
                                        child: Text('login'),)
                                  ),
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
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 38,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: AlignmentDirectional(
                                                      -0.7, -0.01),
                                                  child: Container(
                                                    width: 18,
                                                    height: 18,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      'https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png?w=512&h=512',
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(onPressed: ()async{

                                                  await AuthController.instance.auth.signInWithGoogle();

                                                }, child: Text('google')),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 0, 0, 0),
                                            child: Container(
                                              width: 100,
                                              height: 38,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        -0.7, -0.01),
                                                    child: Container(
                                                      width: 18,
                                                      height: 18,
                                                      clipBehavior:
                                                      Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(onPressed: (){}, child: Text('google')),
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
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 10, 0),
                                          child: Text(
                                            'Don\'t have an account?',
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFFADADAD),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        TextButton(onPressed: () {

                                          Get.to(()=>SignUpWidget());
                                        },
                                          child: Text('SignUp',style: getText(context).button?.apply(color: Colors.lightBlue),),


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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
