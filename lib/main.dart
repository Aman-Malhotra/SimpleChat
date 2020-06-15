import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holmusk_task/Constants/routes.dart';
import 'package:holmusk_task/SharedPref/sharedPref.dart';
import 'package:holmusk_task/Widgets/chatRoom/chatRoom_pm.dart';
import 'package:holmusk_task/Widgets/dashboard/dashboard.dart';
import 'package:holmusk_task/Widgets/dashboard/dashboard_pm.dart';
import 'package:holmusk_task/Widgets/profile/profile.dart';
import 'package:holmusk_task/Widgets/profile/profile_pm.dart';
import 'package:holmusk_task/Widgets/signIn/signIn.dart';
import 'package:holmusk_task/Widgets/signIn/signIn_pm.dart';
import 'package:holmusk_task/Widgets/signUp/signUp.dart';
import 'package:holmusk_task/Widgets/signUp/signUp_pm.dart';
import 'package:holmusk_task/Widgets/splash/splash_pm.dart';
import 'package:provider/provider.dart';
import 'Widgets/chatRoom/chatRoom.dart';
import 'Widgets/splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SharedPref.clearCache();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RouteNames.splash: (context) => ChangeNotifierProvider(
              create: (context) => SplashPm(context),
              child: Splash(),
            ),
        RouteNames.login: (context) => ChangeNotifierProvider(
              create: (context) => SignInPm(context),
              child: SignIn(),
            ),
        RouteNames.create: (context) => ChangeNotifierProvider(
              create: (context) => SignUpPm(context),
              child: SignUp(),
            ),
        RouteNames.dashboard: (context) => ChangeNotifierProvider(
              create: (context) => DashboardPm(context),
              child: Dashboard(),
            ),
        RouteNames.chatRoom: (context) => ChangeNotifierProvider(
              create: (context) => ChatRoomPm(context),
              child: ChatRoom(),
            ),
        RouteNames.profile: (context) => ChangeNotifierProvider(
              create: (context) => ProfilePm(context),
              child: Profile(),
            ),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
    );
  }
}
