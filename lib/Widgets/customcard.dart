import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Data/getJson.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/Services/Router.dart';
import 'package:quiz_app/provider.dart';

class customcard extends StatelessWidget {
  String langname, image, des;
  Locale local;

  customcard(this.langname, this.image, this.des, this.local);

  @override
  Widget build(BuildContext context) {
    return Consumer<myProvider>(
      builder: (context,provider,m)=>Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.0.h,
          horizontal: 30.0.w,
        ),
        child: InkWell(
          onTap: () {
            provider.setasset(local: local,langname: langname,);
           AppRouter.appRouter.goReplacement(getjson());
          },
          child: Material(
            color: Colors.orangeAccent,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0.h,
                    ),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        // changing from 200 to 150 as to look better
                        height: 150.0.h,
                        width: 150.0.w,
                        child: ClipOval(
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      langname,
                      style: TextStyle(
                        fontSize: 20.0.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      des,
                      style: TextStyle(
                          fontSize: 18.0.sp,
                          color: Colors.white,
                      ),
                      maxLines: 5,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
