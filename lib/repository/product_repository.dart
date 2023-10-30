import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductRepository {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getProducts() async {
    return await _fireStore.collection('products').get();
  }
  
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() async {
    return await _fireStore.collection('users').doc(auth.currentUser!.uid.toString()).get();
  }

  Future<void> insertProducts(String title, String price, String address, String userAddress, String nickname, String imageUrl, int favoriteCount, bool isChecked) async {
    await _fireStore.collection('products').add({
      'auth': auth.currentUser!.uid.toString(),
      'title': title,
      'price': price,
      'address': address,
      'userAddress': userAddress,
      'nickname': nickname,
      'imageUrl': imageUrl,
      'favoriteCount': favoriteCount,
      'isChecked': isChecked,
    });
  }

  Future<void> favoriteAddProducts() async {
    DocumentReference productRef = _fireStore.collection('products').doc(auth.currentUser!.uid.toString());
    DocumentSnapshot productSnapshot = await productRef.get();

    if (productSnapshot.exists) {
      dynamic productData = productSnapshot.data();

      if (productData != null && productData.containsKey('favoriteCount')) {
        int newFavoriteCount = productData['favoriteCount'] + 1;

        await productRef.update({'favoriteCount': newFavoriteCount});
        print('favoriteCount 업데이트 완료');
      } else {
        print('favoriteCount 데이터가 존재하지 않습니다.');
      }
    } else {
      print('해당 제품을 찾을 수 없습니다.');
    }
  }

  Future<int> getUserProductCount() async {
    var querySnapshot = await _fireStore
        .collection('products')
        .get();

    return querySnapshot.docs.length;
  }
}