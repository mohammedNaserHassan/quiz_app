import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/Data/data.dart';
import 'package:quiz_app/Widgets/customcard.dart';
import 'package:animated_background/animated_background.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with  TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Locale local = EasyLocalization.of(context).locale;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                EasyLocalization.of(context).setLocale(
                    local == Locale('ar') ? Locale('en') : Locale('ar'));
              },
              icon: Icon(Icons.language))
        ],
        title: Text(
          'Name'.tr(),
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
            ],
          ),
        ],
      ),
    );
  }
}
