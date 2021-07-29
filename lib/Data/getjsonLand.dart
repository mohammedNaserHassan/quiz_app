import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/quizpage.dart';

class getjsonLand extends StatelessWidget {
  String langname;
  Locale local;

  getjsonLand(this.langname, this.local);

  String assettoload;

  setasset() {
    switch (langname) {
      case "Python":
        if (local == Locale('en')) {
          assettoload = "assets/Langs/python.json";
        } else {
          assettoload = 'assets/Langs/PythonAra.json';
        }
        ;
        break;
      case "Java":
        if (local == Locale('en')) {
          assettoload = "assets/Langs/java.json";
        } else {
          assettoload = "assets/Langs/javaarab.json";
        }
        break;
      case "Javascript":
        if (local == Locale('en')) {
          assettoload = "assets/Langs/js.json";
        } else {
          assettoload = "assets/Langs/jsarab.json";
        }
        break;
      case "C++":
        if (local == Locale('en')) {
          assettoload = "assets/Langs/cpp.json";
        } else {
          assettoload = "assets/Langs/cpparab.json";
        }
        break;
      default:
        if (local == Locale('en')) {
          assettoload = "assets/Langs/linux.json";
        } else {
          assettoload = "assets/Langs/linuxarab.json";
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
      future:
      DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading....",
              ),
            ),
          );
        } else {
          return quizpage(mydata: mydata, locale: local);
        }
      },
    );
  }
}
