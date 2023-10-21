import 'package:customer_manager/main.dart';
import 'package:customer_manager/services/auth/firebaseAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pretty_button/pretty_button.dart';

typedef AuthTypeCallback = void Function(bool);

// ignore: must_be_immutable
class BuildRegisterFinishButton extends StatefulWidget {

  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  bool isRegisterSelected = false;
  bool isLoginSelected = false;

  BuildRegisterFinishButton({
    Key? key,
    required this.emailTextController,
    required this.passwordTextController,
    required this.isRegisterSelected,
    required this.isLoginSelected,
  }) : super(key: key);

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
          if (widget.isRegisterSelected) {
            firebaseAuthRegister (
              widget.emailTextController.text.toString(),
              widget.passwordTextController.text.toString(),
              context
            );
          }

          if (widget.isLoginSelected) {
            firebaseAuthLogin (
              widget.emailTextController.text.toString(),
              widget.passwordTextController.text.toString(),
              context
            );
          }
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
