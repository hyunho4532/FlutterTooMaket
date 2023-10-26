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
      appBar: AppBar (
        title: const Text (
          '중고 물품 등록하기',
          style: TextStyle (
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,

        leading: GestureDetector (

          onTap: () {
            Navigator.pop(context);
          },

          child: const Icon (
              Icons.arrow_back,
              color: Colors.black
          ),
        ),
      ),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox (
            width: MediaQuery.of(context).size.width,
            height: 300,

            child: CachedNetworkImage (
              imageUrl: widget.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),

          Padding (
            padding: const EdgeInsets.only(left: 16.0),
            child: Text (
              '제목: ${widget.title}',
              style: const TextStyle (
                color: Colors.black87,
                fontSize: 22.0,
              ),
            ),
          ),

          GestureDetector (
            onTap: () {

            },

            child: const Padding (
              padding: EdgeInsets.only(top: 36.0, left: 16.0),
              child: Text (
                '신고하기',
                style: TextStyle (
                  color: Colors.redAccent,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
