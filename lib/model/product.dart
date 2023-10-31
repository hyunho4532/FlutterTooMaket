import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String authUid;
  final String title;
  final String price;
  final String address;
  final String userAddress;
  final String nickname;
  final String? imageUrl;
  final int favoriteCount;
  final bool? isChecked;
  final bool? isSelected;

  ProductModel ({
    required this.authUid,
    required this.title,
    required this.price,
    required this.address,
    required this.userAddress,
    required this.nickname,
    this.imageUrl,
    required this.favoriteCount,
    this.isChecked,
    this.isSelected,
  });

  toJson() {
    return {
      "authUid": authUid,
      "title": title,
      "price": price,
      "address": address,
      "userAddress": userAddress,
      "nickname": nickname,
      "imageUrl": imageUrl,
      "favoriteCount": favoriteCount,
      "isChecked": isChecked,
      "isSelected": isSelected,
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductModel (
      authUid: data["authUid"] ?? "",
      title: data["title"] ?? "",
      price: data["price"] ?? "",
      address: data["address"] ?? "",
      userAddress: data["userAddress"] ?? "",
      nickname: data["nickname"] ?? "",
      imageUrl: data["imageUrl"],
      favoriteCount: data["favoriteCount"] ?? 0,
      isChecked: data["isChecked"],
      isSelected: data["isSelected"],
    );
  }
}