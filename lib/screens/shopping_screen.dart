import 'package:flutter/material.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold (
      body: Column (
        children: [
          Text (
            'ddd',
            style: TextStyle (
               color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
