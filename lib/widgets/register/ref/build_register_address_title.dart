import 'package:flutter/material.dart';

class BuildRegisterAddressTitle extends StatelessWidget {
  const BuildRegisterAddressTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding (
      padding: EdgeInsets.only(left: 24.0, top: 48.0),
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        child: Text(
          '마지막으로 주소를 입력해주세요!!',
        ),
      ),
    );
  }
}
