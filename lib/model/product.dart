import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String title;
  final String price;
  final String address;
  final String? imageUrl;

  ProductModel ({
    required this.title,
    required this.price,
    required this.address,
    this.imageUrl,
  });

  toJson() {
    return {
      "title": title,
      "price": price,
      "address": address,
      "imageUrl": imageUrl,
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductModel (
      title: data["title"] ?? "",
      price: data["price"] ?? "",
      address: data["address"] ?? "",
      imageUrl: data["imageUrl"],
    );
  }
}