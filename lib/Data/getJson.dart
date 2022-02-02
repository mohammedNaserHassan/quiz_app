import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Screens/quizpage.dart';
import 'package:quiz_app/provider.dart';

class getjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<myProvider>(
      builder: (co, provider, n) => FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString(provider.assettoload, cache: false),
        builder: (context, snapshot) {
          provider.setData(json.decode(snapshot.data.toString()));
          if (provider.mydata == null) {
            return Scaffold(
              body: Center(
                child: Text(
                  "Loading....",
                ),
              ),
            );
          } else {
            return quizpage();
          }
        },
      ),
    );
  }
}
