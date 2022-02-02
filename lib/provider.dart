import 'dart:async';
import 'dart:math';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/resultpage.dart';
import 'package:quiz_app/Services/Router.dart';

import 'Data/data.dart';

class myProvider extends ChangeNotifier {
  String message, image;
  int marks=0;

  void calMark() {
    if (marks < 20) {
      image = imagess[2];
      message = "20".tr() + '\n' + "You Scored".tr() + '\t' + "$marks";
    } else if (marks < 35) {
      image = imagess[1];
      message = "35".tr() + '\n' + "You Scored".tr() + '\t' + "$marks";
    } else {
      image = imagess[0];
      message = "else".tr() + "\n" + "You Scored".tr() + '\t' + "$marks";
    }
    notifyListeners();
  }

  double percent = 0.0;
  Color right = Colors.green,
      wrong = Colors.red,
      colortoshow = Colors.indigoAccent;
  int i = 1, j = 1, markss = 0;
  bool disableAnswer = false, state_answer = false;
  var random_array;
  Map<String, Color> btncolor = {
    "a": Colors.white,
    "b": Colors.white,
    "c": Colors.white,
    "d": Colors.white,
  };

  genrandomarray() {
    var distinctIds = [];
    var rand = new Random();
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(10));
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 10) {
        continue;
      } else {
        break;
      }
    }
    notifyListeners();
  }

//
  void nextquestion() {
    if (j < 10) {
      i = random_array[j];
      j++;
    } else {
      AppRouter.appRouter.goReplacement(resultpage());
    }
    btncolor["a"] = Colors.white;
    btncolor["b"] = Colors.white;
    btncolor["c"] = Colors.white;
    btncolor["d"] = Colors.white;
    disableAnswer = false;
    notifyListeners();
  }

  List mydata;
  setData(List<dynamic>data){
    this.mydata=data;
    notifyListeners();
  }
  Locale locale;
  final GlobalKey<FormState> form = GlobalKey();
  TextEditingController password_controller = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();

//
  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 5;
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    percent += 0.1;
    btncolor[k] = colortoshow;
    disableAnswer = true;
    state_answer = !state_answer;
     Timer(Duration(seconds: 2), nextquestion);
    notifyListeners();
  }


  String assettoload;
  setasset({Locale local,String langname}) {
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
    notifyListeners();
  }
}
