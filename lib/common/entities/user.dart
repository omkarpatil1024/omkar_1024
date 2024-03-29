import 'package:cloud_firestore/cloud_firestore.dart';

class LoginRequestEntity {
  int? type;
  String? name;

  // String? description;
  String? email;

  // String? phone;
  String? avatar;
  String? id;

  // int? online;
  String? token;
  String? created_at;

  LoginRequestEntity(
      {this.type,
      this.name,
      // this.description,
      this.email,
      //this.phone,
      this.avatar,
      this.id,
      //this.online,
      this.token,
      this.created_at});

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        //"description": description,
        "email": email,
        //"phone": phone,
        "avatar": avatar,
        "id": id,
        //"online": online,
        "token": token,
        "created_at": created_at
      };
}

//api post response msg
class UserLoginResponseEntity {
  bool? status;
  String? message;
  UserItem? data;

  UserLoginResponseEntity({
    this.status,
    this.message,
    this.data,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        status: json["status"],
        message: json["message"],
        data: UserItem.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() =>
      {"message": message, "status": status, "data": data};
}

// login result
class UserItem {
  String? access_token;
  String? token;
  String? name;
  String? email;

  //String? description;
  String? avatar;
  String? created_at;

  //int? online;
  int? type;

  UserItem({
    this.access_token,
    this.token,
    this.name,
    this.email,
    this.created_at,
    //this.description,
    this.avatar,
    //this.online,
    this.type,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
        access_token: json["access_token"],
        token: json["token"],
        name: json["name"],
        email: json["email"],
        //description: json["description"],
        avatar: json["avatar"],
        //online: json["online"],
        created_at: json["created_at"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": access_token,
        "token": token,
        "name": name,
        "email": email,
        //"description": description,
        "avatar": avatar,
        "created_at": created_at,
        //"online": online,
        "type": type,
      };
}

class UserData {
  final String? token;
  final String? name;
  final String? avatar;
  final String? description;
  final int? online;

  UserData({
    this.token,
    this.name,
    this.avatar,
    this.description,
    this.online,
  });

  factory UserData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserData(
      token: data?['token'],
      name: data?['name'],
      avatar: data?['avatar'],
      description: data?['description'],
      online: data?['online'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (token != null) "token": token,
      if (name != null) "name": name,
      if (avatar != null) "avatar": avatar,
      if (description != null) "description": description,
      if (online != null) "online": online,
    };
  }
}
