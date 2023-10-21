import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BuildLottieFile extends StatelessWidget {
  const BuildLottieFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 420,
      left: 0,
      right: 0,
      bottom: 0,
      child: Lottie.asset(
        'assets/lottie/register.json',
        width: 270,
        fit: BoxFit.fill, // or BoxFit.cover based on your preference
      ),
    );
  }
}
