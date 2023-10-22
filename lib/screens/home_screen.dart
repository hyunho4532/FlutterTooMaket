import 'dart:convert';

import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:customer_manager/widgets/floating_button/build_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold (

      floatingActionButton: AnimatedFloatingActionButton (
        fabButtons: [
          buildFirstFloatButton(),
          buildSecondFloatButton(),
        ],

        key: key,
        colorStartAnimation: Colors.blueAccent,
        colorEndAnimation: Colors.redAccent,
        animatedIconData: AnimatedIcons.menu_close,
      ),

      body: Column (
        children: [

          ImageSlideshow (
            width: double.infinity,
            height: 200,
            initialPage: 0,
            indicatorColor: Colors.blue,
            indicatorBackgroundColor: Colors.grey,

            onPageChanged: (value) {

            },

            autoPlayInterval: 3000,

            isLoop: true,

            children: const [
              Padding (
                padding: EdgeInsets.all(16.0),
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text (
                      '환영합니다!',
                      style: TextStyle (
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    Text (
                      '중고 제품을 판매하기 위해 주소를 입력해주세요!!',
                      style: TextStyle (
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
