import 'package:common_test1/models/authentication.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  var auth = Auth();
}


var authController = AuthController.instance;