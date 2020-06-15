import 'package:flutter/material.dart';
import 'package:holmusk_task/Constants/constTheme.dart';
import 'package:holmusk_task/Models/friends.dart';
import 'package:holmusk_task/Shared/widgets.dart';
import 'package:holmusk_task/Widgets/drawer/drawer.dart';
import 'package:holmusk_task/Widgets/drawer/drawer_pm.dart';
import 'package:provider/provider.dart';
import './dashboard_pm.dart';

// Copy the line below and add as a child where you want to use Dashboard Widget
// ChangeNotifierProvider(create:(context)=>DashboardPm(),child: Dashboard())

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DashboardPm dashboardPm = Provider.of<DashboardPm>(context);

    Widget chatTile(Friends friend) {
      return ListTile(
        title: Text(
          friend.name,
          style: theme(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w500),
        ),
        leading: CircleAvatar(
          child: Text(friend.name[0]),
        ),
        onTap: () => dashboardPm.openChatRoom(friend),
      );
    }

    return Scaffold(
      drawer: ChangeNotifierProvider(
        create: (context) => DrawerPm(context),
        child: DrawerWidget(),
      ),
      appBar: appBar(
        context: context, 
        text: "Dashboard"
      ),
      body: dashboardPm.friendsList != null
          ? ListView.builder(
              itemBuilder: (context, i) {
                return chatTile(dashboardPm.friendsList.friends[i]);
              },
              itemCount: dashboardPm.friendsList.friends.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
