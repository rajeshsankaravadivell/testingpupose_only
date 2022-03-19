import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/profilemodel.dart';
import '../services.dart';

class ProfileController extends GetxController {
  createProfile(ProfileForm profile) {
    var json = {
      "name": profile.name.text,
      "age": profile.age.text,
      // "gender": profile.gender.index,
      "height": profile.height.text,
      "date" : DateTime.parse(profile.date.text),
      // "address": profile.address,
      // "maritalStatus": profile.maritalStatus,
      // "colors": profile.colors
    };
    users.add(json);
  }

  updateProfile() {}
  deleteProfile() {}
  readProfile() {}
}

class ProfileForm {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController date = TextEditingController();
}
