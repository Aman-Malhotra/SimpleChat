import 'dart:io';

import 'package:flutter/material.dart';
import 'package:holmusk_task/Api/apiCalls.dart';
import 'package:holmusk_task/Constants/routes.dart';
import 'package:holmusk_task/Models/friends.dart';

class DashboardPm extends ChangeNotifier {
  final BuildContext context;
  FriendsList friendsList;
  var json = {
    "friends": [
      {"id": "1", "name": "Aman", "last_message": "Hello"},
      {"id": "2", "name": "Arjun", "last_message": "Hey"}
    ]
  };
  DashboardPm(this.context) {
    getAllFriends();
  }
  getAllFriends() async {
    try {
      await new Future.delayed(const Duration(seconds : 3));
      friendsList = await ApiCalls().getFreinds();
    } catch (e) {
      friendsList = FriendsList.fromJson(json);
      notifyListeners();
    }
  }

  openChatRoom(Friends friend) {
    Navigator.of(context).pushNamed(
      RouteNames.chatRoom,
      arguments: friend,
    );
  }
}
