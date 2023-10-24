import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String fullName;
  final String title;
  final String address;
  final String currentDate;

  ProductModel ({
    required this.fullName,
    required this.title,
    required this.address,
    required this.currentDate
  });

  toJson() {
    return {
      "FullName": fullName,
      "Title": title,
      "Address": address,
      "CurrentDate": currentDate,
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductModel (
      fullName: data["FullName"],
      title: data["Title"],
      address: data["Address"],
      currentDate: data["CurrentDate"],
    );
  }
}