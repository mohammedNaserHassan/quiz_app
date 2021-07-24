import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/Screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
        Locale('cpp'),
        Locale('js'),
        Locale('linux'),
        Locale('java'),
        Locale('python')
      ],
      path: 'assets/Langs',
      fallbackLocale: Locale(
        'en',
      ),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392.7, 803.6),
      builder: () => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.deepPurpleAccent),
        home: Splashscreen(),
      ),
    );
  }
}
