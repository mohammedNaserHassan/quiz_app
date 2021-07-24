import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 30), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Homepage(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 50.h),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/photoo.png'),
                        fit: BoxFit.cover,
                      ),
                    )),
                Positioned(
                    top: 25.h,
                    left: 0.w,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: 40.sp,
                        )))
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'What\’s Your Dream Holiday Destinations? ',
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              )),
          SizedBox(
            height: 30.h,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(
                'By answering these questions , we can help you to find you the location of your dream vocation',
                style: TextStyle(
                    fontSize: 17.sp, color: Colors.black.withOpacity(0.4)),
              )),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 40.w, top: 80.h, right: 10.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.orange),
                  width: 6.w,
                  height: 6.h),
              Container(
                margin: EdgeInsets.only(top: 80.h, right: 10.w),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                width: 6.w,
                height: 6.h,
              ),
              Container(
                margin: EdgeInsets.only(top: 80.h, right: 10.w),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                width: 6.w,
                height: 6.h,
              ),
              Container(
                margin: EdgeInsets.only(top: 80.h, right: 10.w),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                width: 6.w,
                height: 6.h,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (x) => Homepage()));
                  },
                  child: Container(
                    width: 200.w,
                    height: 100.h,
                    margin: EdgeInsets.only(left: 88.w, top: 63.h),
                    child: Center(
                        child: Text(
                      'Start Quiz',
                      style: TextStyle(color: Colors.white, fontSize: 25.sp),
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.orange.withOpacity(0.5), width: 3.w),
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
          )
        ],
      ),
    );
  }
}
