import 'package:customer_manager/repository/product_repository.dart';
import 'package:flutter/material.dart';

class ProductInsertScreen extends StatefulWidget {
  const ProductInsertScreen({Key? key}) : super(key: key);

  @override
  State<ProductInsertScreen> createState() => _ProductInsertScreenState();
}

class _ProductInsertScreenState extends State<ProductInsertScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final ProductRepository _repository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Padding (
        padding: const EdgeInsets.all(16.0),
        child: Column (
          children: [
            TextField (
              controller: _titleController,
              decoration: const InputDecoration (
                labelText: '물품 이름'
              ),
            ),

            const SizedBox (
              height: 16,
            ),

            TextField (
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration (
                labelText: '가격'
              ),
            ),

            const SizedBox (
              height: 20,
            ),


          ],
        ),
      ),
    );
  }
}
