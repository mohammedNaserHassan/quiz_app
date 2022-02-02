import 'package:quiz_app/Model/Person.dart';
import 'package:quiz_app/Model/glopals.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class sp_helper{
  sp_helper._();
  static sp_helper x =sp_helper._();
  SharedPreferences sharedPreferences;
  initSharedPreference()async{
    sharedPreferences= await SharedPreferences.getInstance();
  }
  SaveUsername(String name){
    sharedPreferences.setString('name', name);
  }
  String GetUsername(){
    return sharedPreferences.getString('name');
  }

  saveUser(Person form){
    sharedPreferences.setString('user', json.encode({...form.toMap()}));
    Glopals.glopals.form=form;
  }
  Person getUser(){
    String user = sharedPreferences.getString('user');
    if(user==null){
      return null;
    }
    Map usermap= json.decode(user);
    Person formu = Person.fromMap(usermap);
    Glopals.glopals.form=formu;
    return formu;
  }
  Signout(){
    sharedPreferences.remove('user');
  }
}