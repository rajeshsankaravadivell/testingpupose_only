import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common_test1/controllers/authcontroller.dart';
import 'package:common_test1/controllers/myauthcontroller.dart';
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
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Map<String,dynamic> myprofile = {
    'full_name': 'hi', // John Doe
    'company': 'digisailor', // Stokes and Sons
    'age': '28' // 42
  };

  Future<void> addUser() {


    final snackBar = SnackBar(
      content: const Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    // Call the user's CollectionReference to add a new user
    return users
        .add(myprofile)
        .then((value) =>  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('user added successfully'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    ))
    )
        .catchError((error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:  Text(error),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.put(ProfileController());
  }

  var controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
          actions: [
            IconButton(
                onPressed: () async {
                  await auth1.signOut();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // controller = Get.find();
          },
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: users.doc('bJLKKD8KBvvhNJJ9d6Pu').get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return Column(
                children: [
                  Text("Full Name: ${data['full_name']} ${data['last_name']}"),
                  ElevatedButton(onPressed: (){addUser();}, child: Text('add'))
                ],
              );
            }

            return Text("loading");
          },
        )
    );
  }
}
