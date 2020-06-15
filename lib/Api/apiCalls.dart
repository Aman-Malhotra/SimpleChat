import 'dart:convert';

import 'package:holmusk_task/Api/apiLinks.dart';
import 'package:holmusk_task/Models/friends.dart';
import 'package:holmusk_task/Models/messages.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  Future<String> login(Map cred) async {
    String token;
    var body = jsonEncode(cred);
    await http
        .post(
      ApiLinks.login,
      body: body,
    )
        .then((http.Response response) {
      token = jsonDecode(response.body)["token"];
    });
    return token;
  }

  Future<String> create(Map cred) async {
    String token;
    var body = jsonEncode(cred);
    await http
        .post(
      ApiLinks.create,
      body: body,
    )
        .then((http.Response response) {
      token = jsonDecode(response.body)["token"];
    });
    return token;
  }

  Future<FriendsList> getFreinds() async {
    String response;
    await http.get(ApiLinks.login).then((http.Response r) {
      response = '{"friends": ' + r.body + '}';
    });
    return FriendsList.fromJson(jsonDecode(response));
  }

  Future<MessagesList> getMessages(String friendId) async {
    String response;

    await http.get(ApiLinks.messages(friendId)).then((http.Response r) {
      response = '{"messages": ' + r.body + '}';
    });

    return MessagesList.fromJson(jsonDecode(response));
  }

  Future<String> sendMessage(String recieverId, String message) async {
    String res;
    var body = jsonEncode({"message": message});
    await http
        .post(
      ApiLinks.message(recieverId),
      body: body,
    )
        .then((http.Response r) {
      res = r.body;
    });
    return res;
  }
}
