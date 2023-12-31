import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_manager/model/product.dart';
import 'package:customer_manager/repository/product_repository.dart';
import 'package:customer_manager/screens/product/product_detail_screen.dart';
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
      appBar: AppBar (
        title: const Text (
          '이러한 물품들을 찜했습니다.',
          style: TextStyle (
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),

        backgroundColor: Colors.white70,
      ),

      body: Column (
        children: [
          FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: productRepository.getFavoriteUserProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('에러 났습니다: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Text('데이터가 없습니다.');
              }

              var products = snapshot.data!.docs;

              return Expanded (
                child: ListView.builder (
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    var product = ProductModel.fromSnapshot(products[index]);
                    var formattedProduct = products[index];
                    var imageUrl = formattedProduct['imageUrl'];

                    return GestureDetector (
                      onTap: () {
                        Navigator.of(context).push (
                            MaterialPageRoute(builder: (_) => ProductDetailScreen(imageUrl: imageUrl, title: product.title, nickname: product.nickname, userAddress: product.userAddress,))
                        );
                      },

                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row (
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            imageUrl != null
                                ? SizedBox(
                              width: 100,
                              height: 100,
                              child: CachedNetworkImage (
                                imageUrl: '$imageUrl',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const CircularProgressIndicator(),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            )
                                : Container(
                              width: 150,
                              height: 150,
                              color: Colors.grey,
                            ),

                            const SizedBox(width: 16),

                            Column (
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Row (
                                  children: [
                                    Padding (
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: SizedBox (
                                        width: 120,
                                        height: 30,

                                        child: Text (
                                          product.title.length > 8
                                              ? '${product.title.substring(0, 14)}...'
                                              : product.title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox (
                                  width: 120,

                                  child: Padding (
                                    padding: const EdgeInsets.only(bottom: 16.0),
                                    child: Text (
                                      product.address,
                                      style: const TextStyle (
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ),

                                Row (
                                  children: [
                                    Text (
                                      '${product.price} 원 ',
                                      style: const TextStyle (
                                        fontSize: 14.0,
                                      ),
                                    ),

                                    Padding (
                                        padding: const EdgeInsets.only(left: 80),
                                        child: product.isChecked == true ? const Text (
                                            '가격 제안 O'
                                        ) : const Text (
                                            '가격 제안 X'
                                        )
                                    ),
                                  ],
                                ),

                                Row (
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,

                                  children: [

                                    Padding (
                                        padding: const EdgeInsets.only(left: 162.0),
                                        child: GestureDetector (
                                          onTap: () {
                                            productRepository.favoriteAddProducts();
                                          },

                                          child: Text (
                                            '관심: ${product.favoriteCount.toString()}',
                                            style: const TextStyle (
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                    ),
                                  ],
                                ),

                                SizedBox (
                                  width: 0,
                                  height: 0,

                                  child: Opacity (
                                    opacity: 0.0,

                                    child: Text (
                                      product.userAddress,
                                      style: const TextStyle (
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox (
                                  width: 0,
                                  height: 0,

                                  child: Opacity (
                                    opacity: 0.0,

                                    child: Text (
                                      product.nickname,
                                      style: const TextStyle (
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
