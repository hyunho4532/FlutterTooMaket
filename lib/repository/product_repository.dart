import 'package:customer_manager/model/Product.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductRepository {
  final databaseReference = FirebaseDatabase.instance.reference();

  Future<void> insertProduct(Product product) async {
    await databaseReference.child('products').push().set({
      'title': product.title,
      'price': product.price,
    });

    Stream<DatabaseEvent> getProducts() {
      return databaseReference.child('products').onValue;
    }
  }
}