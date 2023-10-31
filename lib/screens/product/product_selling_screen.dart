import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_manager/model/product.dart';
import 'package:customer_manager/repository/product_repository.dart';
import 'package:flutter/material.dart';

class ProductSellingScreen extends StatefulWidget {
  const ProductSellingScreen({Key? key}) : super(key: key);

  @override
  State<ProductSellingScreen> createState() => _ProductSellingScreenState();
}

class _ProductSellingScreenState extends State<ProductSellingScreen> {

  ProductRepository productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column (
        children: [
          FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: productRepository.getUserProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              var productDocs = snapshot.data?.docs;

              if (productDocs == null || productDocs.isEmpty) {
                return const Text(
                  '이런 상품을 등록하지 않았군요.',
                );
              }

              var productWidgets = productDocs.map((productDoc) {
                var product = ProductModel.fromSnapshot(productDoc);
                var imageUrl = product.imageUrl;

                return Padding (
                  padding: const EdgeInsets.only(top: 16.0, left: 24.0),
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      CachedNetworkImage (
                        width: 120,
                        height: 120,
                        imageUrl: imageUrl.toString(),
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ],
                  ),
                );
              }).toList();

              return Expanded (
                child: SizedBox (
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  child: ListView (
                    scrollDirection: Axis.vertical,

                    children: productWidgets,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
