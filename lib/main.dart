import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Helper/Sql_helper.dart';
import 'package:quiz_app/Helper/sp_helper.dart';

import 'package:quiz_app/Screens/RegisterScreen.dart';
import 'package:quiz_app/Screens/home.dart';
import 'package:quiz_app/provider.dart';

import 'Services/Router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sp_helper.x.initSharedPreference();
  await DbHelper.x.intiateDatabase();
  await EasyLocalization.ensureInitialized();
  runApp(
      ChangeNotifierProvider<myProvider>(
          create: (context) => myProvider(),
          child: EasyLocalization(
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
      child: MyApp())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: 360,
          maxHeight: 690,
        ),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return MaterialApp(
        navigatorKey: AppRouter.appRouter.navkey,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.deepPurpleAccent),
        home:  sp_helper.x.getUser()==null?RegisterScreen():Homepage()
    );
  }
}
