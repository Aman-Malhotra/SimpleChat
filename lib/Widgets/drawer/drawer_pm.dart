import 'package:flutter/material.dart';
import 'package:holmusk_task/Constants/routes.dart';
import 'package:holmusk_task/SharedPref/sharedPref.dart';

class DrawerPm extends ChangeNotifier {
  final BuildContext context;
  DrawerPm(this.context) {
    //This is the constructor
  }
  onProfile() {
    Navigator.of(context).pushNamed(RouteNames.profile);
  }

  logout() {
    SharedPref.clearCache();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.login, (route) => false);
  }
}
