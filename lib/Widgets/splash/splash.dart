import 'package:flutter/material.dart';
import 'package:holmusk_task/Constants/constTheme.dart';
import 'package:holmusk_task/Widgets/splash/splash_pm.dart';

import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SplashPm splashPm = Provider.of<SplashPm>(context);
    return Scaffold(
      body: Center(
        child: Text(
          "HOLMUSK",
          style: theme(context).textTheme.headline2.copyWith(
            fontWeight: FontWeight.w600,

          ),
        ),
      ),
    );
  }
}
