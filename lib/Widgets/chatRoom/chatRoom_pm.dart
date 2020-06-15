import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:holmusk_task/Api/apiCalls.dart';
import 'package:holmusk_task/Models/friends.dart';
import 'package:holmusk_task/Models/messages.dart';

class ChatRoomPm extends ChangeNotifier {
  final BuildContext context;
  MessagesList messagesList;
  Friends friend;
  File image;
  final picker = ImagePicker();
  var json = {
    "messages": [
      {"id": "1", "text": "Hello", "time": "12:03 "},
      {"id": "2", "text": "Hey", "time": "12:04 "},
      {"id": "3", "text": "How  are you ?", "time": "12:05 "}
    ]
  };
  ChatRoomPm(this.context) {}
  setFriend(Friends f) {
    this.friend = f;
    getMessages();
  }

  getMessages() async {
    try {
      await new Future.delayed(const Duration(seconds: 3));
      messagesList = await ApiCalls().getMessages(this.friend.id);
    } catch (e) {
      messagesList = MessagesList.fromJson(json);
      messagesList.messages = messagesList.messages.reversed.toList();
      notifyListeners();
    }
  }

  getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File.fromUri(Uri.parse(pickedFile.path));
  }

  getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    image = File.fromUri(Uri.parse(pickedFile.path));
  }
}
