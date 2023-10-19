import 'package:flutter/material.dart';
import 'package:pretty_button/pretty_button.dart';

// ignore: must_be_immutable
class BuildRegisterFinishButton extends StatefulWidget {

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  BuildRegisterFinishButton({Key? key, required this.emailTextController, required this.passwordTextController}) : super(key: key);

  @override
  State<BuildRegisterFinishButton> createState() => _BuildRegisterFinishButtonState();
}

class _BuildRegisterFinishButtonState extends State<BuildRegisterFinishButton> {

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.only(right: 16.0, top: 250.0),
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

        },
        child: Text('완료',
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
