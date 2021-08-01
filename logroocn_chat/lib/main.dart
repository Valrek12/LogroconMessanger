import 'package:flutter/material.dart';
import 'package:logroocn_chat/pages/root_page.dart';
import 'package:logroocn_chat/services/authentification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const primarySwatch = Colors.green;
  // button color
  static const buttonColor = Colors.black;
  // app name
  static const appName = 'Logrocon Chat';
  // boolean for showing home page if user unverified
  static const homePageUnverified = false;

  final params = {
    'appName': appName,
    'primarySwatch': primarySwatch,
    'buttonColor': buttonColor,
    'homePageUnverified': homePageUnverified,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new RootPage(
        params: params,
        auth: new Auth(),
      ),
    );
  }
}
