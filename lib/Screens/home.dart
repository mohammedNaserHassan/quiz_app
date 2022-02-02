import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Data/data.dart';
import 'package:quiz_app/Helper/sp_helper.dart';
import 'package:quiz_app/Screens/RegisterScreen.dart';
import 'package:quiz_app/Services/Router.dart';
import 'package:quiz_app/Widgets/customcard.dart';
import 'package:animated_background/animated_background.dart';
import 'package:quiz_app/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    Locale local = EasyLocalization.of(context).locale;
    Provider.of<myProvider>(context,listen: false).locale=local;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Consumer<myProvider>(
      builder:(context,provider,n)=> Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white10,
          actions: [
            IconButton(
                onPressed: () {
                  EasyLocalization.of(context).setLocale(
                      provider.locale == Locale('ar') ? Locale('en') : Locale('ar'));
                },
                icon: Icon(
                  Icons.language,
                  color: Colors.grey,
                ))
          ],
          title: Text(
            'Name'.tr(),
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Stack(
          children: [
            AnimatedBackground(
              behaviour: RandomParticleBehaviour(),
              vsync: this,
              child: Container(),
            ),
            ListView(
              children: <Widget>[
                customcard('P'.tr(), images[0], 'PDe'.tr(), local),
                customcard("J".tr(), images[1], "JDe".tr(), local),
                customcard("JS".tr(), images[2], "JSDe".tr(), local),
                customcard("C".tr(), images[3], "CDe".tr(), local),
                customcard('L'.tr(), images[4], 'LDe'.tr(), local),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: ListTile(
                    title: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    onTap: () {
                      sp_helper.x.Signout();
                      AppRouter.appRouter.goReplacement(RegisterScreen());
                    },
                    trailing: Icon(Icons.logout),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
