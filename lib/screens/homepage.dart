import 'package:common_test1/controllers/authcontroller.dart';
import 'package:common_test1/controllers/profile_controller.dart';
import 'package:common_test1/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/custom_text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _form = ProfileForm();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.put(ProfileController());

  }
  var controller;

  createProfile(ProfileForm profile) {
    var json = {
      "name": profile.name.text,
      "age": profile.age.text,
      "height": profile.height.text,
      "date" : DateTime.parse(profile.date.text),
    };
    print(json);
    users.doc(authController.auth.currentUser!.uid).set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
          actions: [
            IconButton(
                onPressed: () async {
                  await AuthController.instance.auth.signOut();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // controller = Get.find();
           createProfile(_form);
          },
        ),
        body: Form(
            child: Column(
          children: [
            CustomTextFormField(
              labelText: 'Name',
              controller: _form.name,
            ),
            CustomTextFormField(
              labelText: 'Age',
              controller: _form.age,
              keyboardType: TextInputType.number,

            ),
            CustomTextFormField(
              labelText: 'Height',
              controller: _form.height,
              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              labelText: 'Date',
              controller: _form.date,
              keyboardType: TextInputType.datetime,
            ),
          ],
        )));
  }
}
