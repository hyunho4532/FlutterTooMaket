import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getUsers() async {
    return await _fireStore.collection('users').get();
  }

  Future<void> insertUsers(String address, String nickname, String auth) async {
    await _fireStore.collection('users').doc(auth).set ({
      'address': address,
      'nickname': nickname,
    });
  }
}