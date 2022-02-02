import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Data/data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/Services/Router.dart';
import 'package:quiz_app/provider.dart';
import 'home.dart';
import 'package:easy_localization/easy_localization.dart';

class resultpage extends StatefulWidget {

  resultpage();

  @override
  _resultpageState createState() => _resultpageState();
}

class _resultpageState extends State<resultpage> {
  @override
  void initState() {
   Provider.of<myProvider>(context,listen: false).calMark();
    super.initState();
  }

  _resultpageState();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Consumer<myProvider>(
      builder:(context,provider,index)=> Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white10,
          title: Text(
            "Result".tr(),
            style: TextStyle(color: Colors.grey),
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
                                provider.image,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.0.h,
                            horizontal: 15.0.w,
                          ),
                          child: Text(
                             Name,
                             style: TextStyle(
                               fontSize: 18.0.sp,
                             ),
                              )),
                  Text(
                    provider.message,
                    style: TextStyle(
                      fontSize: 20.0.sp,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                      Text(
                        'من أصل 50',
                        style: TextStyle(
                            fontSize: 20.0.sp,
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w600
                        ),
                      )
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
                      AppRouter.appRouter.goReplacement(Homepage());
                    },
                    child: Text(
                      "Continue".tr(),
                      style: TextStyle(
                        fontSize: 30.0.sp,
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
      ),
    );
  }
}
