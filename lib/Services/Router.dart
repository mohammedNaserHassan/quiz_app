import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter{
  AppRouter._();
  static AppRouter appRouter =AppRouter._();
  GlobalKey<NavigatorState> navkey = GlobalKey<NavigatorState>();

  ////Go to other page and pop current page by name
  gotoPagewithReplacment(String routeName){
    navkey.currentState.pushReplacementNamed(routeName);
  }

  ////Go to other page
  gotoPage(String routeName){
    navkey.currentState.pushNamed(routeName);
  }

  ////Go to other page and pop current page by widget
  goReplacement(Widget widget){
    navkey.currentState.pushReplacement(MaterialPageRoute(builder: (x)=>widget));
  }

  ///Return reverse page
  back(){
    navkey.currentState.pop();
  }
}