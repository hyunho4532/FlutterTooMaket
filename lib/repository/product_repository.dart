import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductRepository {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getProducts() async {
    return await _fireStore.collection('products').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserProducts() async {
    var userUID = auth.currentUser!.uid.toString();
    return await _fireStore.collection('products').where('auth', isEqualTo: userUID).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getFavoriteUserProducts() async {
    var userUID = auth.currentUser!.uid.toString();
    return await _fireStore.collection('favorites').where('auth', isEqualTo: userUID).get();
  }
  
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() async {
    return await _fireStore.collection('users').doc(auth.currentUser!.uid.toString()).get();
  }

  Future<void> insertProducts(String title, String price, String address, String userAddress, String nickname, String category, String imageUrl, int favoriteCount, bool isChecked, bool isSelected, ) async {
    await _fireStore.collection('products').add({
      'auth': auth.currentUser!.uid.toString(),
      'title': title,
      'price': price,
      'address': address,
      'userAddress': userAddress,
      'nickname': nickname,
      'category': category,
      'imageUrl': imageUrl,
      'favoriteCount': favoriteCount,
      'isSelected': isSelected,
      'isChecked': isChecked,
    });
  }

  Future<void> insertFavoriteProduct(String auth, String title, String address, String imageUrl, String price) async {
    try {
      await _fireStore.collection('favorites').add ({
        'auth': auth,
        'title': title,
        'address': address,
        'imageUrl': imageUrl,
        'price': price,
      });
    } catch (e) {
      print('Error adding favorite product: $e');
    }
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