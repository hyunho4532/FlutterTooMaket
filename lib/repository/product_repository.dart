import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getProducts() async {
    return await _fireStore.collection('products').get();
  }

  Future<void> insertProducts(String title, String price, String address, String userAddress, String nickname, String imageUrl, bool isChecked) async {
    await _fireStore.collection('products').add ({
      'title': title,
      'price': price,
      'address': address,
      'userAddress': userAddress,
      'nickname': nickname,
      'imageUrl': imageUrl,
      'isChecked': isChecked,
    });
  }
}