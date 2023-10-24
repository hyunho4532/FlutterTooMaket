import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String title;
  final String price;
  final String address;

  ProductModel ({
    required this.title,
    required this.price,
    required this.address,
  });

  toJson() {
    return {
      "title": title,
      "price": price,
      "address": address,
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductModel (
      title: data["title"],
      price: data["price"],
      address: data["address"],
    );
  }
}