import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/splash.dart';
import 'package:quiz_app/Widgets/social.dart';

import 'home.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey();
  final _password_controller = TextEditingController();
  final email = TextEditingController();
  Map<String, String> _auth_data = {
    'email': '',
    'password': '',
  };

  LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(46, 100, 180, 1),
        body: SingleChildScrollView(
          child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    margin: EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    child: Image.asset(
                      'images/logiin.png',
                      fit: BoxFit.cover,
                    )),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 40),
                    width: 330,
                    height: 380,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Form(
                      key: _form,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 230, top: 8),
                                child: Text('Email Id')),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 15),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: TextFormField(
                                controller: email,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) {
                                  if (val.isEmpty || !val.contains('@')) {
                                    return 'Invalid email';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _auth_data['email'] = value;
                                },
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                  right: 230,
                                  top: 8,
                                ),
                                child: Text('Password')),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: TextFormField(
                                obscureText: true,
                                controller: _password_controller,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  border: InputBorder.none,
                                ),
                                validator: (val) {
                                  if (val.isEmpty || val.length < 5) {
                                    return 'Invalid password';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _auth_data['password'] = value;
                                },
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(11, 58, 114, 1),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  if (!email.text.isEmpty &&
                                      !_password_controller.text.isEmpty) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (x) => Splashscreen()));
                                  }
                                },
                                child: Text(
                                  ' Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            Center(
                                child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Text('Continue with'))),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Social(
                                  color: Color.fromRGBO(70, 120, 195, 1),
                                  image: 'images/f.png',
                                ),
                                Social(
                                  color: Color.fromRGBO(0, 180, 250, 1),
                                  image: 'images/twitter.png',
                                ),
                                Social(
                                  color: Colors.red,
                                  image: 'images/g.png',
                                  imagecolor: Colors.white,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
              ])),
        ));
  }
}
