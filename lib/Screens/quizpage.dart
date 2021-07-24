import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/Screens/home.dart';
import 'package:quiz_app/Screens/resultpage.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class quizpage extends StatefulWidget {
  final List mydata;
  Locale locale;

  quizpage({this.mydata, this.locale});

  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {
  final List mydata;

  _quizpageState(this.mydata);

  double percent = 0.1;
  Color right = Colors.orange,
      wrong = Colors.red,
      colortoshow = Colors.indigoAccent;
  int i = 1, j = 1, timer = 30, marks = 0, counter = 1;
  bool disableAnswer = false, canceltimer = false, state_answer = false;
  String showtimer = "30";
  var random_array;
  Map<String, Color> btncolor = {
    "a": Colors.white,
    "b": Colors.white,
    "c": Colors.white,
    "d": Colors.white,
  };

//
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
  }

//
  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

//
  void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (j < 10) {
        i = random_array[j];
        j++;
        counter++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.white;
      btncolor["b"] = Colors.white;
      btncolor["c"] = Colors.white;
      btncolor["d"] = Colors.white;
      disableAnswer = false;
    });
    starttimer();
  }

//
  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 5;
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      percent += 0.1;
      btncolor[k] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
      state_answer = !state_answer;
    });
    Timer(Duration(seconds: 2), nextquestion);
  }

  @override
  void initState() {
    starttimer();
    genrandomarray();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Quiz",
                  ),
                  content: Text("You Can't Go Back At This Stage."),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
        backgroundColor: Color(0xff5F66D0),
        body: Stack(
          children: [
            Positioned(
              top: 104.h,
              left: 30.w,
              child: Container(
                child: Text(
                  'Question ${counter}/10',
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              ),
            ),
            Positioned(
              bottom: 80.h,
              left: 20.w,
              right: 20.w,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 530.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff7A7FDC),
                            blurRadius: 0,
                            offset: Offset(0.w, 25.h), // Shadow position
                          ),
                          BoxShadow(
                            color: Color(0xff9CA2E7),
                            blurRadius: 2,
                            offset: Offset(0.w, 15.h), // Shadow position
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 20.h),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              mydata[0][i.toString()],
                              style: TextStyle(
                                fontSize: 12.0.sp,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: AbsorbPointer(
                            absorbing: disableAnswer,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  choicebutton('a'),
                                  choicebutton('b'),
                                  choicebutton('c'),
                                  choicebutton('d'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(right: 250.w),
                            child: Text(
                              'Timer :${showtimer}',
                              style: TextStyle(
                                fontSize: 17.0.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Times New Roman',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    right: 0.w,
                    child: InkWell(
                      onTap: () {
                        nextquestion();
                        setState(() {
                          percent += 0.1;
                        });
                      },
                      child: Container(
                        width: 200.w,
                        height: 70.h,
                        margin: EdgeInsets.only(left: 88.w, top: 63.h),
                        child: Center(
                            child: Text(
                          'Next',
                          style:
                              TextStyle(color: Colors.white, fontSize: 25.sp),
                        )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            color: Colors.orange),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: 5.h,
                left: -20.w,
                child: TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (x)=>Homepage()));
                  },
                  child: Image.asset(
                    'images/x.png',
                    width: 120.w,
                    height: 120.h,
                  ),
                )),
            Positioned(
                top: 147.h,
                left: 20.w,
                child: Image.asset(
                  'images/user.png',
                  width: 120.w,
                  height: 140.h,
                )),
            Positioned(
              top: 130.h,
              left: 30.w,
              child: LinearPercentIndicator(
                width: 350.0.w,
                lineHeight: 10.0.h,
                percent: percent,
                progressColor: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget choicebutton(String k) {
    return InkWell(
      onTap: () => checkanswer(k),
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        height: 45.h,
        width: 300.w,
        decoration: BoxDecoration(
            color: btncolor[k],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.grey)),
        child: Container(
          margin: EdgeInsets.only(top: 7.h, left: 10.w),
          child: Row(
            mainAxisAlignment: widget.locale == Locale('en')
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              colortoshow == right
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              Text(
                mydata[1][i.toString()][k],
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
