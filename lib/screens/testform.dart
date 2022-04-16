import 'package:common_test1/models/testform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  InputForm({Key? key}) : super(key: key);

  ProfileForm controller = ProfileForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.profile.add();
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            onChanged: (String text) {
              controller.name = text;
            },
          ),
          TextFormField(
            onChanged: (String text) {
              controller.age = text;
            },
          ),
        ],
      ),
    );
  }
}
