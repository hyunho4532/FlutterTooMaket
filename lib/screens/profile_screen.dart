import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_manager/model/product.dart';
import 'package:customer_manager/repository/product_repository.dart';
import 'package:customer_manager/screens/product/product_favorite_screen.dart';
import 'package:customer_manager/screens/product/product_selling_screen.dart';
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

            Padding (
              padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
                child: SizedBox (
                  width: MediaQuery.of(context).size.width,
                  height: 60,

                  child: GestureDetector (
                    onTap: () {
                      Navigator.of(context).push (
                        MaterialPageRoute(builder: (_) => const ProductSellingScreen()),
                      );
                    },

                    child: const Card (
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Padding (
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text (
                              '판매 내역',
                              style: TextStyle (
                                fontSize: 16.0,
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                ),
            ),

            Padding (
              padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0) ,
              child: SizedBox (
                width: MediaQuery.of(context).size.width,
                height: 60,

                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push (
                      MaterialPageRoute(builder: (_) => const ProductFavoriteScreen()),
                    );
                  },

                  child: const Card (
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Padding (
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text (
                              '관심 내역',
                              style: TextStyle (
                                fontSize: 16.0,
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
