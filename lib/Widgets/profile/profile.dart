import 'package:flutter/material.dart';
import 'package:holmusk_task/Constants/constTheme.dart';
import 'package:holmusk_task/Shared/widgets.dart';
import 'package:provider/provider.dart';
import './profile_pm.dart';

// Copy the line below and add as a child where you want to use Profile Widget
// ChangeNotifierProvider(create:(context)=>ProfilePm(),child: Profile())

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfilePm profilePm = Provider.of<ProfilePm>(context);
    return Scaffold(
      appBar: appBar(
        context: context, 
        text: "Profile"
      ),
    );
  }
}
