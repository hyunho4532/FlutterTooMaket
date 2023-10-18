import 'package:flutter/material.dart';
import 'package:pretty_button/pretty_button.dart';

// ignore: must_be_immutable
class BuildRegisterPrevButton extends StatefulWidget {

  PageController pageController;

  BuildRegisterPrevButton({Key? key, required this.pageController}) : super(key: key);

  @override
  State<BuildRegisterPrevButton> createState() => _BuildRegisterPrevButtonState();
}

class _BuildRegisterPrevButtonState extends State<BuildRegisterPrevButton> {

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.only(left: 16.0, top: 250.0),
      child: PrettyButton (
        isDisable: false,
        blurRadius: 5,
        spreadRadius: 1,
        topShadowColor: Theme.of(context).colorScheme.onPrimary,
        bottomShadowColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.outlineVariant,
        width: 60,
        height: 50,
        borderRadius: 15,
        innerPadding: const EdgeInsets.all(8.0),
        outerPadding: const EdgeInsets.all(8.0),
        onTap: () {
          widget.pageController.animateToPage (
            0,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut
          );
        },
        child: Text('이전',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
