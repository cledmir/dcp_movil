import 'package:cloud_firestore/cloud_firestore.dart';

class LoginRequestEntity {
  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? photoURL;
  String? uid;
  int? online;

  LoginRequestEntity({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.photoURL,
    this.uid,
    this.online,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "description": description,
        "email": email,
        "phone": phone,
        "photoURL": photoURL,
        "uid": uid,
        "online": online,
      };

  Map<String, dynamic> toFirestore() {
    return {
      if (type != null) "type": type,
      if (name != null) "name": name,
      if (description != null) "description": description,
      if (email != null) "email": email,
      if (phone != null) "phone": phone,
      if (photoURL != null) "photoURL": photoURL,
      if (uid != null) "uid": uid,
      if (online != null) "online": online,
    };
  }
}

//api post response msg
class UserLoginResponseEntity {
  int? code;
  String? msg;
  UserItem? data;

  UserLoginResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: UserItem.fromJson(json["data"]),
      );
}

// login result
class UserItem {
  String? uid;
  String? email;
  String? name;
  String? photoURL;
  int? type;

  UserItem({
    this.uid,
    this.email,
    this.name,
    this.photoURL,
    this.type,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
        uid: json["uid"],
        email: json["email"],
        name: json["name"],
        photoURL: json["photoURL"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "photoURL": photoURL,
        "type": type,
      };
}

class UserData {
  final String? token;
  final String? name;
  final String? photoURL;
  final String? description;
  final int? online;

  UserData({
    this.token,
    this.name,
    this.photoURL,
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
      photoURL: data?['photoURL'],
      description: data?['description'],
      online: data?['online'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (token != null) "token": token,
      if (name != null) "name": name,
      if (photoURL != null) "photoURL": photoURL,
      if (description != null) "description": description,
      if (online != null) "online": online,
    };
  }
}
