import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String address;
  String nickname;

  UserModel({
    required this.address,
    required this.nickname
  });

  toJson() {
    return {
      "address": address,
      "nickname": nickname
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UserModel (
      address: data["address"] ?? "",
      nickname: data["nickname"] ?? ""
    );
  }
}