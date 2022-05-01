import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common_test1/controllers/authcontroller.dart';
import 'package:common_test1/controllers/myauthcontroller.dart';
import 'package:common_test1/controllers/profile_controller.dart';
import 'package:common_test1/models/profilemodel.dart';
import 'package:common_test1/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Widgets/custom_text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');






  Map<String, dynamic> myprofile = {
    'full_name': 'hi', // John Doe
    'company': {
      'adresline1': 'line2',
      'adresline2': 'line2'
    }, // Stokes and Sons
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
        .doc('2')
        .set(myprofile)
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('user added successfully'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            )))
        .catchError(
            (error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(error),
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
        bottomNavigationBar: BottomAppBar(
          color: Color(0xFF6210ee),
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.menu), onPressed: () {}),
              Spacer(),
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF6210ee),
          title: const Text('Homepage'),
          actions: [

            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {
                  // addUser();
                  moviesRef.add(Movie(title: 'Terminator', genre: 'Action'));
                },
                child: Text('add')),
            IconButton(
                onPressed: () async {
                  await auth1.signOut();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: StreamBuilder<QuerySnapshot>(
          stream: moviesRef.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }



            if (snapshot.connectionState == ConnectionState.active &&
                snapshot.hasData) {
              List<QueryDocumentSnapshot> data=snapshot.data!.docs;

              return ListView.builder(

                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                     
                      leading: CircleAvatar(
                        child: Image.network('https://cdn-icons-png.flaticon.com/512/1038/1038100.png'),
                      ),

                      title: Text(data[index]['title']),
                      subtitle: Text(data[index]['genre']),
                    ),
                  );
                },
              );
            }

            return Text("loading");
          },
        ));
  }
}
