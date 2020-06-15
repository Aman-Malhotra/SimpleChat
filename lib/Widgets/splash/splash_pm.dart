import 'package:flutter/material.dart';
import 'package:holmusk_task/Constants/routes.dart';
import 'package:holmusk_task/SharedPref/sharedPref.dart';
import 'package:holmusk_task/SharedPref/sharedPrefConstantStrings.dart';

class SplashPm extends ChangeNotifier {
  final BuildContext context;
  SplashPm(this.context) {
    checkLoggedIn();
  }
  void checkLoggedIn() async {
    await new Future.delayed(const Duration(seconds : 3));
    String loggedIn = await SharedPref.getData(ConstStrings.loggedIn);
    if (loggedIn == "true") {
      Navigator.of(context).pushReplacementNamed(RouteNames.dashboard);
    } else {
      Navigator.of(context).pushReplacementNamed(RouteNames.login);
    }
  }
}
