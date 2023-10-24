import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getProducts() async {
    return await _fireStore.collection('products').get();
  }

  Future<DocumentReference<Map<String, dynamic>>> insertProducts(String title, String price, String address) async {
    return await _fireStore.collection('products').add ({
      'title': title,
      'price': price,
      'address': address,
    });
  }
}