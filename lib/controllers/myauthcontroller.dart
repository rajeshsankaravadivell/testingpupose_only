import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Authcontroller1 extends GetxController {
  static Authcontroller1 instance = Get.find();

  final _firebaseAuth = FirebaseAuth.instance;
  Stream<User?> authStateChnages() => _firebaseAuth.authStateChanges();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<User?> signUpwithEmail(String email, String password) async {

    final userCredantial =await _firebaseAuth.createUserWithEmailAndPassword(email: email,   password: password);
return userCredantial.user;


    }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
  Future<String> resetPassword({required String email}) async {
    return _firebaseAuth
        .sendPasswordResetEmail(email: email)
        .then((value) => "Success")
        .catchError((error) {
      return error.code.toString();
    });
  }


  User? get currentUser => _firebaseAuth.currentUser;

  String? get uid => currentUser?.uid;





  }

  Authcontroller1 auth1=Authcontroller1.instance;

