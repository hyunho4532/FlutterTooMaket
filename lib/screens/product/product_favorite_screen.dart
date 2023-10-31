import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_manager/model/product.dart';
import 'package:customer_manager/repository/product_repository.dart';
import 'package:flutter/material.dart';

class ProductFavoriteScreen extends StatefulWidget {
  const ProductFavoriteScreen({Key? key}) : super(key: key);

  @override
  State<ProductFavoriteScreen> createState() => _ProductFavoriteScreenState();
}

class _ProductFavoriteScreenState extends State<ProductFavoriteScreen> {

  ProductRepository productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Column (
        children: [
          FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: productRepository.getFavoriteUserProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              var productDocs = snapshot.data?.docs;

              if (productDocs == null || productDocs.isEmpty) {
                return const Center (
                  child: Padding (
                    padding: EdgeInsets.only(top: 120),
                    child: Text (
                      '찜한 상품이 없네요...',
                      style: TextStyle (
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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

                      imageUrl != null
                          ? SizedBox(
                        width: 110,
                        height: 110,
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      )
                          : Container(
                        width: 150,
                        height: 150,
                        color: Colors.grey,
                      ),

                      Text (
                        product.title,
                      )
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
