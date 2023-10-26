import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {

  var imageUrl = "";

  String title = "";

  ProductDetailScreen({Key? key, required this.imageUrl, required this.title}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Column (
        children: [
          Padding (
            padding: const EdgeInsets.all(20.0),
            child: SizedBox (
              width: MediaQuery.of(context).size.width,
              height: 70,

              child: CachedNetworkImage (
                imageUrl: widget.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),

          Text (
            widget.title,
            style: const TextStyle (
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
