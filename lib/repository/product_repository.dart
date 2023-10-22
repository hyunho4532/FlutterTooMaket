import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getProducts() async {
    return await _fireStore.collection('products').get();
  }
}