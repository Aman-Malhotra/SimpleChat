import 'package:flutter/material.dart';
import 'package:holmusk_task/Api/apiCalls.dart';
import 'package:holmusk_task/Constants/routes.dart';
import 'package:holmusk_task/SharedPref/sharedPref.dart';
import 'package:holmusk_task/SharedPref/sharedPrefConstantStrings.dart';

class SignInPm extends ChangeNotifier {
  final BuildContext context;
  TextEditingController name;
  TextEditingController pass;
  SignInPm(this.context) {
    this.name = new TextEditingController();
    this.pass = new TextEditingController();
  }

  signIn() async {
    Map cred = {
      "username": name.text.trim(),
      "password": pass.text.trim(),
    };

    ApiCalls().login(cred).then((String token) {
      if (token != null) {
        // successful login
        // save the token to shared pref
        // change logged in to true and proceed
      }
    });

    // change logged in to true anyway and proceed
    await SharedPref.saveData(ConstStrings.loggedIn, "true");
    Navigator.of(context).pushReplacementNamed(RouteNames.dashboard);
  }

  openCreateAccount() {
    Navigator.of(context).pushNamed(RouteNames.create);
  }
}
