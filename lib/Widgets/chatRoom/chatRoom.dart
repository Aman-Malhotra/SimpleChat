import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:holmusk_task/Models/friends.dart';
import 'package:holmusk_task/Models/messages.dart';
import 'package:provider/provider.dart';
import './chatRoom_pm.dart';

// Copy the line below and add as a child where you want to use ChatRoom Widget
// ChangeNotifierProvider(create:(context)=>ChatRoomPm(),child: ChatRoom())

class ChatRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChatRoomPm chatRoomPm = Provider.of<ChatRoomPm>(context);
    Friends friend = ModalRoute.of(context).settings.arguments;
    if (chatRoomPm.friend == null && friend != null) {
      chatRoomPm.setFriend(friend);
    }

    Widget messageTile(Messages message) {
      return ListTile(
        title: Text(message.text),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("ChatRoom"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: chatRoomPm.messagesList != null
          ? Column(
              children: [
                Expanded(
                  flex: 8,
                  child: ListView.builder(
                    reverse: true,
                    itemBuilder: (context, i) {
                      return messageTile(chatRoomPm.messagesList.messages[i]);
                    },
                    itemCount: chatRoomPm.messagesList.messages.length,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SpeedDial(
                            child: Icon(Icons.attach_file, color: Colors.black,),
                            elevation: 0.0,
                            backgroundColor: Colors.transparent,
                            children: [
                              SpeedDialChild(
                                child: Icon(Icons.camera),
                                onTap: chatRoomPm.getImageCamera,
                              ),
                              SpeedDialChild(
                                child: Icon(Icons.image),
                                onTap: chatRoomPm.getImageGallery,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
