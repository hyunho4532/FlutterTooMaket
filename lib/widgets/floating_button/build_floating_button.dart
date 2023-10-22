import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:flutter/material.dart';

final GlobalKey<AnimatedFloatingActionButtonState> key = GlobalKey<AnimatedFloatingActionButtonState>();

Widget buildFirstFloatButton() {
  return const FloatingActionButton (
    onPressed: null,
    heroTag: "btn2",
    tooltip: "First Button",
    child: Icon (
        Icons.add
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