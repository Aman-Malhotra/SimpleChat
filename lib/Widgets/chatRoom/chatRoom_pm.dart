import 'dart:io';
import 'dart:math';
import 'package:holmusk_task/bottomModelSheet/bottomModelSheet.dart';
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
  TextEditingController text;
  ImagePicker picker;
  var json = {
    "messages": [
      {"id": "1", "text": "Hello", "time": "12:03 "},
      {"id": "2", "text": "Hey", "time": "12:04 "},
      {"id": "3", "text": "How  are you ?", "time": "12:05 "}
    ]
  };
  ChatRoomPm(this.context) {
    this.text = new TextEditingController();
    this.picker = ImagePicker();
  }
  setFriend(Friends f) {
    this.friend = f;
    getMessages();
  }

  Future getMessages() async {
    try {
      await new Future.delayed(const Duration(seconds: 3));
      messagesList = await ApiCalls().getMessages(this.friend.id);
    } catch (e) {
      messagesList = MessagesList.fromJson(json);
      // messagesList.messages = messagesList.messages.reversed.toList();
      notifyListeners();
    }
  }

  sendMessage() {
    // send message from here
    this.messagesList.messages.add(Messages(
          id: Random().nextInt(500).toString(),
          text: text.text,
          time: "",
        ));
    text.clear();
    image = null;
    modalBottomSheetMenu("Message api call here", context);
    notifyListeners();
  }

  getImageGallery() async {
    image = null;
    PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      noImageSelected();
    } else {
      image = File.fromUri(Uri.parse(pickedFile.path));
    }
    notifyListeners();
  }

  getImageCamera() async {
    image = null;
    PickedFile pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile == null) {
      noImageSelected();
    } else {
      image = File.fromUri(Uri.parse(pickedFile.path));
    }
    notifyListeners();
  }

  noImageSelected() {
    modalBottomSheetMenu("No image selected", context, error: true);
  }
}
