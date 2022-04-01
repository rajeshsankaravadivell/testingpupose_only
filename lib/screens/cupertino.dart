import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class CupertinomyApp extends StatefulWidget {
  const CupertinomyApp({Key? key}) : super(key: key);

  @override
  State<CupertinomyApp> createState() => _CupertinomyAppState();
}

class _CupertinomyAppState extends State<CupertinomyApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(

        tabBar: CupertinoTabBar(

      items: [


      ],

    ), tabBuilder: (context,i){
      return Container(


      );

    });
  }
}
