import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/Data/data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home.dart';

class resultpage extends StatefulWidget {
  int marks;

  resultpage({this.marks});

  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  String message, image;

  @override
  void initState() {
    if (marks < 20) {
      image = imagess[2];
      message = "You Should Try Hard..\n" + "You Scored $marks";
    } else if (marks < 35) {
      image = imagess[1];
      message = "You Can Do Better..\n" + "You Scored $marks";
    } else {
      image = imagess[0];
      message = "You Did Very Well..\n" + "You Scored $marks";
    }
    super.initState();
  }

  int marks;

  _resultpageState(this.marks);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0.w,
                        height: 300.0.h,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0.h,
                          horizontal: 15.0.w,
                        ),
                        child: Center(
                          child: Text(
                            message,
                            style: TextStyle(
                              fontSize: 18.0.sp,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ignore: deprecated_member_use
                OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ));
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18.0.sp,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0.h,
                    horizontal: 25.0.w,
                  ),
                  borderSide: BorderSide(width: 3.0.w, color: Colors.indigo),
                  splashColor: Colors.indigoAccent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
