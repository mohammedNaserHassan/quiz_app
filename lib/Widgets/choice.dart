import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class choiceWidget extends StatelessWidget {
  String k;
   choiceWidget({this.k});

  @override
  Widget build(BuildContext context) {
    return Consumer<myProvider>(
      builder: (context,provider,index)=>InkWell(
          onTap: () => provider.checkanswer(k),
          child: Container(
            margin: EdgeInsets.only(bottom: 20.h),
            height: 45.h,
            width: 300.w,
            decoration: BoxDecoration(
                color: provider.btncolor[k],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey)),
            child: Container(
              margin: EdgeInsets.only(top: 7.h, left: 10.w),
              child: Row(
                mainAxisAlignment: provider.locale == Locale('en')
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children: [
                  provider.colortoshow == provider.right
                      ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Icon(
                      Icons.check_circle_outline,
                      color: Colors.white,
                    ),
                  )
                      : Container(),
                  Text(
                    provider.mydata[1][provider.i.toString()][k],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );

  }
}
