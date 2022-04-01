// import 'dart:ffi';
//
// import 'package:common_test1/controllers/authcontroller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../models/profilemodel.dart';
// import '../services.dart';
//
// class ProfileController extends GetxController {
//   createProfile(ProfileForm profile) {
//     var json = {
//       "name": profile.name.text,
//       "age": profile.age.text,
//       // "gender": profile.gender.index,
//       "height": profile.height.text,
//       "date": DateTime.parse(profile.date.text),
//       // "address": profile.address,
//       // "maritalStatus": profile.maritalStatus,
//       // "colors": profile.colors
//     };
//   }
//
//   updateProfile() {}
//   deleteProfile() {}
//   readProfile() {}
// }
//
// class ProfileForm {
//   TextEditingController name = TextEditingController();
//   TextEditingController age = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController height = TextEditingController();
//   TextEditingController line1 = TextEditingController();
//   TextEditingController line2 = TextEditingController();
//   Gender gender = Gender.male;
//   DateTime? dob;
//   String? uid;
//
//   Address get address => Address(line1: line1.text, line2: line2.text);
//
//   Profile get profile => Profile(
//         uid: authController.auth.currentUser!.uid,
//         name: name.text,
//         email: email.text,
//         address: address.,
//         height: double.parse(height.text),
//
//       );
// }
