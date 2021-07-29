import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter{
  AppRouter._();
  static AppRouter appRouter = AppRouter._();
   GlobalKey<NavigatorState> globalKey =GlobalKey<NavigatorState>();
  
  pushFunction(Widget widget){
    globalKey.currentState.push(
      MaterialPageRoute(builder: (x)=> widget)
    );
  }
  pushnamed(String x){
    globalKey.currentState.pushNamed(x);
  }
  pushreplacment(Widget widget){
    globalKey.currentState.pushReplacement(
        MaterialPageRoute(builder: (x)=> widget)
    );
  }
}