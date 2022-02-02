import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Screens/home.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:quiz_app/Services/Router.dart';
import 'package:quiz_app/Widgets/choice.dart';
import 'package:quiz_app/provider.dart';

class quizpage extends StatefulWidget {
  quizpage();

  @override
  _quizpageState createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
  _quizpageState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { });
    Provider.of<myProvider>(context, listen: false).genrandomarray();
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
      child: Consumer<myProvider>(
        builder: (context, provider, index) => Scaffold(
          backgroundColor: Colors.orange,
          body: Stack(
            children: [
              Positioned(
                top: 104.h,
                left: 30.w,
                child: Container(
                  child: Text(
                    'qu'.tr() + "${provider.j}/10",
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
                      height: 600.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orangeAccent,
                              blurRadius: 0,
                              offset: Offset(0.w, 25.h), // Shadow position
                            ),
                            BoxShadow(
                              color: Colors.deepOrange,
                              blurRadius: 2,
                              offset: Offset(0.w, 15.h), // Shadow position
                            ),
                          ],
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 10.w,
                                right: 10.w,
                              ),
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                mainAxisAlignment:
                                    provider.locale == Locale('en')
                                        ? MainAxisAlignment.spaceBetween
                                        : MainAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.mydata[0][provider.i.toString()] ??
                                        'null',
                                    style: TextStyle(
                                      fontSize: 12.0.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: AbsorbPointer(
                              absorbing: provider.disableAnswer,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    choiceWidget(k: 'a'),
                                    choiceWidget(k: 'b'),
                                    choiceWidget(k: 'c'),
                                    choiceWidget(k: 'd'),
                                  ],
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
                          provider.nextquestion();
                        },
                        child: Container(
                          width: 200.w,
                          height: 70.h,
                          margin: EdgeInsets.only(left: 88.w, top: 63.h),
                          child: Center(
                              child: Text(
                            'Next'.tr(),
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
                  top: 40.h,
                  left: -7.w,
                  child: TextButton(
                      onPressed: () {
                        AppRouter.appRouter.goReplacement(Homepage());
                      },
                      child: Container(
                        width: 70,
                        height: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurpleAccent),
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ))),
              Positioned(
                top: 130.h,
                left: 30.w,
                child: LinearPercentIndicator(
                  width: 350.0.w,
                  lineHeight: 10.0.h,
                  percent: provider.percent,
                  progressColor: Colors.deepPurpleAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
