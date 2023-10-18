import 'package:customer_manager/const/register_animated_text_kit.dart';
import 'package:flutter/material.dart';

class BuildRegisterMainTitle extends StatefulWidget {
  const BuildRegisterMainTitle({Key? key}) : super(key: key);

  @override
  State<BuildRegisterMainTitle> createState() => _BuildRegisterMainTitleState();
}

class _BuildRegisterMainTitleState extends State<BuildRegisterMainTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.only(left: 24.0, top: 48.0),
      child: DefaultTextStyle (
        style: const TextStyle (
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        child: typerTitleAnimatedText,
      ),
    );
  }
}
