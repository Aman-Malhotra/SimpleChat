class FriendsList {
  List<Friends> friends;

  FriendsList({this.friends});

  FriendsList.fromJson(Map<String, dynamic> json) {
    if (json['friends'] != null) {
      friends = new List<Friends>();
      json['friends'].forEach((v) {
        friends.add(new Friends.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.friends != null) {
      data['friends'] = this.friends.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Friends {
  String id;
  String name;
  String lastMessage;

  Friends({this.id, this.name, this.lastMessage});

  Friends.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastMessage = json['last_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_message'] = this.lastMessage;
    return data;
  }
}
