import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {

  var imageUrl = "";

  String title = "";
  String userAddress = "";
  String nickname = "";

  ProductDetailScreen({Key? key, required this.imageUrl, required this.title, required this.userAddress, required this.nickname}) : super(key: key);

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

          Column (
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Row (
                children: [
                  Padding (
                    padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                    child: Image.asset (
                      'assets/image/user.png',
                      width: 40,
                      height: 40,
                    ),
                  ),

                  Column (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding (
                        padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                        child: Text (
                          widget.nickname,
                          style: const TextStyle (
                            color: Colors.black87,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding (
                        padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                        child: Text (
                          widget.userAddress,
                          style: const TextStyle (
                            color: Colors.black87,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),

          const Padding (
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Divider (
                color: Colors.black
            ),
          ),

          Padding (
            padding: const EdgeInsets.only(left: 16.0, top: 32.0),
            child: Text (
              '제목: ${widget.title}',
              style: const TextStyle (
                color: Colors.black87,
                fontSize: 18.0,
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
