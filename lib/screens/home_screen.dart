import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_manager/model/product.dart';
import 'package:customer_manager/repository/product_repository.dart';
import 'package:customer_manager/widgets/floating_button/build_floating_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ProductRepository _productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold (

      floatingActionButton: AnimatedFloatingActionButton (
        fabButtons: [
          buildFirstFloatButton(context),
          buildSecondFloatButton(),
        ],

        key: key,
        colorStartAnimation: Colors.blueAccent,
        colorEndAnimation: Colors.redAccent,
        animatedIconData: AnimatedIcons.menu_close,
      ),

      body: Column(
        children: [
          FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: _productRepository.getProducts(),
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
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    var product = ProductModel.fromSnapshot(products[index]);
                    var formattedProduct = products[index];
                    var imageUrl = formattedProduct['imageUrl'];

                    return ListTile (
                      title: Text(product.title),
                      subtitle: imageUrl != null
                          ? Image.network(
                          imageUrl,
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      )
                          : Container(),
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
