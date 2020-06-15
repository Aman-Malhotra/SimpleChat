import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:holmusk_task/Constants/constTheme.dart';
import 'package:holmusk_task/Models/friends.dart';
import 'package:holmusk_task/Models/messages.dart';
import 'package:holmusk_task/Shared/widgets.dart';
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
        title: Text(
          message.text,
          style: theme(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w500),
        ),
      );
    }

    return Scaffold(
      appBar: appBar(
        context: context, 
        text: "Chat Room"
      ),
      body: chatRoomPm.messagesList != null
          ? RefreshIndicator(
              onRefresh: chatRoomPm.getMessages,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return messageTile(chatRoomPm.messagesList.messages[i]);
                      },
                      itemCount: chatRoomPm.messagesList.messages.length,
                    ),
                  ),
                  SizedBox(
                    height: size(context).height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   width: size(context).width * 0.15,
                        //   child: SpeedDial(
                        //     child: Icon(
                        //       Icons.attach_file,
                        //     ),
                        //     elevation: 0.0,
                        //     // backgroundColor: Colors.transparent,
                        //     children: [
                        //       SpeedDialChild(
                        //         child: IconButton(
                        //           icon: Icon(Icons.camera),
                        //           onPressed: chatRoomPm.getImageCamera,
                        //         ),
                        //       ),
                        //       SpeedDialChild(
                        //         child: IconButton(
                        //           icon: Icon(Icons.image),
                        //           onPressed: chatRoomPm.getImageGallery,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          width: size(context).width * 0.25,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.camera,
                                  color: Colors.black,
                                ),
                                onPressed: chatRoomPm.getImageCamera,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.image,
                                  color: Colors.black,
                                ),
                                onPressed: chatRoomPm.getImageGallery,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size(context).width * 0.75,
                          child: TextFormField(
                            controller: chatRoomPm.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              hintText: "Type Your Message here",
                              suffixIcon: IconButton(
                                icon: Icon(Icons.send),
                                onPressed: chatRoomPm.sendMessage,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
