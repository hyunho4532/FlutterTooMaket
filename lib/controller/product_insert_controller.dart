import 'package:customer_manager/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductInsertController extends GetxController {
  static ProductInsertController get instance => Get.find();

  final _productRepository = Get.put(ProductRepository());

  void getProduct() async {
    await _productRepository.getProducts();
  }
}