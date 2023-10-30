import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_manager/model/product.dart';
import 'package:customer_manager/repository/product_repository.dart';
import 'package:customer_manager/services/auth/firebaseAuth.dart';
import 'package:customer_manager/widgets/profile/build_circular_avatar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String userName = '';
  late int userScore = 0;
  late int userProductCount = 0;

  ProductRepository productRepository = ProductRepository();

  @override
  void initState() {
    super.initState();

    productRepository.getUser()
      .then((snapshot) {
        var data = snapshot.data();

        setState(() {
          userName = data?['nickname'];
        });
    });

    productRepository.getUserProductCount().then((count) {
      setState(() {
        userProductCount = count;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Row (
              children: [
                const BuildCircularAvatar(),

                Column (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding (
                      padding: const EdgeInsets.only(top: 52.0, left: 16.0),
                      child: Text (
                        '$userName님 환영해요!',
                        style: const TextStyle (
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                        ),
                      ),
                    ),

                    const Padding (
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider (
                        color: Colors.black,
                      ),
                    ),

                    Row (
                      children: [
                        const Padding (
                            padding: EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Text (
                              '현재 당신의 어필 점수는? 0점',
                              style: TextStyle (
                                fontSize: 14.0,
                                color: Colors.black87,
                              ),
                            )
                        ),

                        userScore >= 0
                          ? Padding (
                              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                              child: Image.asset (
                                'assets/image/smiling-face.png',
                                width: 30,
                                height: 30,
                              )
                          )
                            : Padding (
                            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Image.asset (
                              'assets/image/angry-face.png',
                              width: 30,
                              height: 30,
                            )
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),

            const Padding (
              padding: EdgeInsets.only(left: 24.0, top: 56.0),
              child: Text (
                '내 상품 내역',
                style: TextStyle (
                  fontSize: 20.0,

                ),
              ),
            ),

            FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: productRepository.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                var productData = snapshot.data;

                if (productData == null || productData.docs.isEmpty) {
                  return const Text (
                      '이런 상품을 등록하지 않았군요.'
                  );
                }

                var authFieldValue = productData.docs[2].data()['auth'];
                print(authFieldValue);

                var userUID = auth.currentUser!.uid.toString();
                print(userUID);

                if (authFieldValue == userUID) {
                  var product = ProductModel.fromSnapshot(productData.docs[0]);
                  var imageUrl = product.imageUrl;

                  return Expanded (
                    child: Padding (
                      padding: const EdgeInsets.only(left: 16.0),
                      child: SizedBox (
                        width: 120,
                        height: 120,
                        child: ListView (
                          children: [
                            Card (
                              shape: RoundedRectangleBorder (
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column (
                                children: [
                                  CachedNetworkImage (
                                    width: 120,
                                    height: 120,
                                    imageUrl: '$imageUrl',
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  // 조건을 만족하지 않는 경우에 대한 처리
                  return SizedBox.shrink(); // 빈 위젯 반환 혹은 다른 처리
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
