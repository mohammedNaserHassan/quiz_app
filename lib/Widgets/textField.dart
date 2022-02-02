import 'package:flutter/material.dart';
class textField extends StatelessWidget {
  TextEditingController textEditingController;
  String label;
  bool state;
   textField({this.textEditingController,this.label,this.state=false});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      padding:
      EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: TextFormField(
        obscureText: state,
        controller: textEditingController,
        decoration: InputDecoration(
          label: Text(label),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.black, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
            BorderSide(color: Colors.black, width: 1.0),
          ),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.emailAddress,
        validator: state?(val) {
          if (val.isEmpty || val.length < 5) {
            return 'Invalid password';
          }
          return null;
        }:(val) {
          if (val.isEmpty || !val.contains('@')) {
            return 'Invalid email';
          }
          return null;
        },
      ),
    );
  }
}
