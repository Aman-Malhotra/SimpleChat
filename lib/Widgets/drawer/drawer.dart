import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './drawer_pm.dart';

// Copy the line below and add as a child where you want to use Drawer Widget
// ChangeNotifierProvider(create:(context)=>DrawerPm(),child: Drawer())

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DrawerPm drawerPm = Provider.of<DrawerPm>(context);
    Widget tile(IconData icon, String text, Function onTap) {
      return ListTile(
        title: Text(
          text,
        ),
        leading: Icon(icon),
        onTap: onTap,
      );
    }

    return Drawer(
      child: ListView(
        children: [
          tile(
            Icons.face,
            "Profile",
            drawerPm.onProfile
          ),
          tile(
            Icons.exit_to_app,
            "Logout",
            drawerPm.logout
          ),
        ],
      ),
    );
  }
}
