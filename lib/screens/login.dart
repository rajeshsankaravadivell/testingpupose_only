



import 'package:common_test1/controllers/myauthcontroller.dart';
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


class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key,}) : super(key: key);



  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController? emailTextController= TextEditingController();
  TextEditingController? passwordTextController= TextEditingController();
  bool?passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode =FocusNode();
  final _formKey= GlobalKey<FormState>();

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
                alignment: AlignmentDirectional(0, -1),
                child: Container(
                  height:MediaQuery.of(context).size.height*0.40,
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

                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(

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
                                  child: Text('Login'),


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

                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: TextFormField(

                                          controller: emailTextController,
                                          obscureText: false,
                                          autocorrect: false,
                                          textInputAction: TextInputAction.next,
                                          focusNode: _emailFocusNode,
                                          onEditingComplete: (){
                                            FocusScope.of(context).requestFocus(_passwordFocusNode);
                                          },

                                          style: GoogleFonts.getFont(
                                            'Open Sans',

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

                                          await auth1.signInWithEmailAndPassword(emailTextController!.text, passwordTextController!.text);

                                        } on FirebaseAuthException catch  (e) {
                                          final snackBar = SnackBar(
                                            content:  Text(e.message.toString()),
                                            action: SnackBarAction(
                                              label: e.code.toString(),
                                              onPressed: () {
                                                // Some code to undo the change.
                                              },
                                            ),
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                          print(e.message);
                                        }








                                        Get.offAll(()=>LandingPage());





                                      },
                                        child: Text('login'),)
                                  ),
                                 TextButton(onPressed: (){
                                   showDialog<String>(
                                     context: context,
                                     builder: (BuildContext context) => AlertDialog(
                                       title:  Text('Enter Your Registered Email address'),
                                       content:  ListTile(
                                         title: TextFormField(
                                           controller: emailTextController,
                                           decoration: InputDecoration(
                                             label: Text('Email')
                                           ),
                                         ),
                                       ),
                                       actions: <Widget>[
                                         TextButton(
                                           onPressed: () => Navigator.pop(context, 'Cancel'),
                                           child: const Text('Cancel'),
                                         ),
                                         TextButton(
                                           onPressed: () {
                                         auth1.resetPassword(email: emailTextController!.text);


                                           },
                                           child: const Text('reset'),
                                         ),
                                       ],
                                     ),
                                   );
                                 }, child: Text('Forgot Password ?')),
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [

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

                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        TextButton(onPressed: () {

                                          Get.to(()=>SignUpWidget());
                                        },
                                          child: Text('SignUp',),


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
