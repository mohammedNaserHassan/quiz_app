import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Data/data.dart';
import 'package:quiz_app/Helper/sp_helper.dart';
import 'package:quiz_app/Model/Person.dart';
import 'package:quiz_app/Helper/Sql_helper.dart';
import 'package:quiz_app/Screens/home.dart';
import 'package:quiz_app/Services/Router.dart';
import 'package:quiz_app/Services/customDialog.dart';
import 'package:quiz_app/Widgets/textField.dart';
import 'package:quiz_app/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Consumer<myProvider>(
      builder: (co, provider, m) => Scaffold(
          backgroundColor: Colors.orange,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Image.asset('images/quizLogo.png')),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                    child: Text(
                      'Register Page',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                Form(
                  key: provider.form,
                  child: Column(
                    children: [
                      textField(
                        textEditingController: provider.name,
                        label: 'Enter your name',
                      ),
                      textField(
                        textEditingController: provider.email,
                        label: 'Enter your email',
                      ),
                      textField(
                        textEditingController: provider.password_controller,
                        state: true,
                        label: 'Enter your password',
                      ),
                      Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            await DbHelper.x.getTablesNames();
                            if (provider.email.text.isNotEmpty &&
                                provider.password_controller.text.isNotEmpty) {
                              rowCount = await DbHelper.x.insertPerson(Person(
                                  name: provider.name.text,
                                  email: provider.email.text,
                                  password: provider.password_controller.text));
                              xPerson = Person(
                                  email: provider.email.text,
                                  name: provider.name.text,
                                  password: provider.password_controller.text);
                              sp_helper.x.saveUser(xPerson);
                              AppRouter.appRouter.goReplacement(Homepage());
                            } else {
                              CustomDialog.customDialog.showCustom(
                                  'you should enter your information!!');
                            }
                            Name = xPerson.name;
                          },
                          child: Text(
                            ' Sign up',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
