import 'package:customer_manager/const/register_animated_text_kit.dart';
import 'package:flutter/material.dart';

class BuildRegisterSubMainTitle extends StatefulWidget {
  const BuildRegisterSubMainTitle({Key? key}) : super(key: key);

  @override
  State<BuildRegisterSubMainTitle> createState() => _BuildRegisterSubMainTitleState();
}

class _BuildRegisterSubMainTitleState extends State<BuildRegisterSubMainTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.only(left: 24.0, top: 20.0),
      child: DefaultTextStyle (
        style: const TextStyle (
          fontSize: 16.0,
          color: Colors.black,
          fontFamily: 'Taebaek_KR',
        ),

        child: typerBodyAnimatedText,
      ),
    );
  }
}
