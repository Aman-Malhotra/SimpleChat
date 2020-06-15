import 'package:flutter/material.dart';
import 'package:holmusk_task/Models/friends.dart';
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
        title: Text(friend.name),
        leading: CircleAvatar(
          child: Text(friend.name[0]),
        ),
        onTap: () => dashboardPm.openChatRoom(friend),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
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
