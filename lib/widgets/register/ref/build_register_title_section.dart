import 'package:customer_manager/const/register_animated_text_kit.dart';
import 'package:flutter/material.dart';

class BuildRegisterSectionTitle extends StatefulWidget {
  const BuildRegisterSectionTitle({Key? key}) : super(key: key);

  @override
  State<BuildRegisterSectionTitle> createState() => _BuildRegisterSectionTitleState();
}

class _BuildRegisterSectionTitleState extends State<BuildRegisterSectionTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.only(left: 24.0, top: 20.0),
      child: DefaultTextStyle (
        style: const TextStyle (
          fontSize: 16.0,
          color: Colors.black,
        ),

        child: typerBodyAnimatedText,
      ),
    );
  }
}
