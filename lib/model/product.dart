import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? id;
  final String fullName;
  final String title;
  final String address;

  ProductModel ({
    this.id,
    required this.fullName,
    required this.title,
    required this.address,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Title": title,
      "Address": address,
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductModel (
      id: document.id,
      fullName: data["FullName"],
      title: data["Title"],
      address: data["Address"],
    );
  }
}