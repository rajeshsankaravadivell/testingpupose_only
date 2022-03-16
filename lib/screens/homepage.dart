import 'package:common_test1/controllers/authcontroller.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        actions: [
          IconButton(onPressed: () async {


            await AuthController.instance.auth.signOut();
          }, icon:Icon(Icons.logout))
        ],
      ),
      body: Container(
        child: Text('HomePage'),
      ),

    );
  }
}
