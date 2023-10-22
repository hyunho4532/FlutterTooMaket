import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:customer_manager/const/bottom_image_item.dart';
import 'package:customer_manager/screens/home_screen.dart';
import 'package:customer_manager/screens/profile_screen.dart';
import 'package:customer_manager/screens/search_screen.dart';
import 'package:customer_manager/screens/shopping_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,

      home: Scaffold (
        body: moviePage(),

        floatingActionButton: FloatingActionButton (
          onPressed: () {

          },
          child: const Icon(Icons.dark_mode),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: AnimatedBottomNavigationBar (
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) => setState(() => _bottomNavIndex = index),
        ),
      ),
    );
  }

  Widget moviePage() {
    switch(_bottomNavIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return const SearchScreen();
      case 2:
        return const ProfileScreen();
      case 3:
        return const ShoppingScreen();
      default:
        return const MainPage();
    }
  }
}
