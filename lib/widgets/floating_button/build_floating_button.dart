import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:flutter/material.dart';

final GlobalKey<AnimatedFloatingActionButtonState> key = GlobalKey<AnimatedFloatingActionButtonState>();

Widget buildFirstFloatButton() {
  return const FloatingActionButton (
    onPressed: null,
    heroTag: "btn2",
    tooltip: "물품 등록",
    child: Icon (
        Icons.add_to_home_screen
    ),
  );
}

Widget buildSecondFloatButton() {
  return const FloatingActionButton (
    onPressed: null,
    heroTag: "btn2",
    tooltip: 'Second button',
    child: Icon (
      Icons.add
    ),
  );
}