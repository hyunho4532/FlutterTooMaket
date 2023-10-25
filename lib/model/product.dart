import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String title;
  final String price;
  final String address;
  final String? imageUrl;
  final bool? isChecked;

  ProductModel ({
    required this.title,
    required this.price,
    required this.address,
    this.imageUrl,
    this.isChecked,
  });

  toJson() {
    return {
      "title": title,
      "price": price,
      "address": address,
      "imageUrl": imageUrl,
      "isChecked": isChecked,
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductModel (
      title: data["title"] ?? "",
      price: data["price"] ?? "",
      address: data["address"] ?? "",
      imageUrl: data["imageUrl"],
      isChecked: data["isChecked"],
    );
  }
}