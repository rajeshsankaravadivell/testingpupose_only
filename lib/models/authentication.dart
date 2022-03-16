
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';


abstract class AuthBase{

  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User> SignInAnonymously();

  Future<UserCredential> signInWithGoogle();
  Future<User?> SignUpWithEmail( String Email, String Password  );

  Future<User?> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();



}


class Auth implements AuthBase{
final _firebaseAuth =FirebaseAuth.instance;





  Stream<User?>  authStateChanges()=> _firebaseAuth.authStateChanges();


  @override
  Future<User> SignInAnonymously() {
    // TODO: implement SignInAnonymously
    throw UnimplementedError();
  }

@override
User? get currentUser => _firebaseAuth.currentUser;






  @override
  Future<UserCredential> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<User?> SignUpWithEmail ( String Email, String Password  ) async {
    // TODO: implement SignInWithEmail
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: Email,
          password: Password,

      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');


      }
    }
  }

@override
Future<User?> signInWithEmailAndPassword(String email, String password) async {
  final userCredential = await _firebaseAuth.signInWithCredential(
    EmailAuthProvider.credential(email: email, password: password),
  );
  return userCredential.user;
}

@override
Future<void> signOut() async {
  await _firebaseAuth.signOut();
}



 //  Future<UserCredential> signInWithGoogle() async {
 //    // Trigger the authentication flow
 //    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
 //
 //    // Obtain the auth details from the request
 //    if(googleUser!=null){
 //
 //      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
 //      if(googleAuth?.idToken!=null){
 //
 //        final credential = GoogleAuthProvider.credential(
 //          accessToken: googleAuth?.accessToken,
 //          idToken: googleAuth?.idToken,
 //        );
 //        return await FirebaseAuth.instance.signInWithCredential(credential);
 //
 //
 //
 //      }
 //      else{
 //        throw FirebaseAuthException(code: 'ERROR_MISSING_ID_TOKEN',message: 'Missing google Id Token');
 //      }
 //
 //    }
 // else{
 //
 //   throw FirebaseAuthException(code: 'ERROR_ABORTED_BY_USER', message: 'Signin aborted by user');
 //    }
 //    // Create a new credential
 //
 //
 //    // Once signed in, return the UserCredential
 //
 //  }



}