import 'package:customer_manager/main.dart';
import 'package:customer_manager/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pretty_button/pretty_button.dart';

// ignore: must_be_immutable
class BuildRegisterFinishButton extends StatefulWidget {

  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  BuildRegisterFinishButton({Key? key, required this.emailTextController, required this.passwordTextController}) : super(key: key);

  @override
  State<BuildRegisterFinishButton> createState() => _BuildRegisterFinishButtonState();
}

class _BuildRegisterFinishButtonState extends State<BuildRegisterFinishButton> {
  final _auth = FirebaseAuth.instance;

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
          _auth.createUserWithEmailAndPassword(
              email: widget.emailTextController.text.toString(),
              password: widget.passwordTextController.text.toString())
            .then((value) => {
              Navigator.push (
                context,
                PageRouteBuilder (
                  pageBuilder: (context, Animation<double> animation1, Animation<double> animation2) {
                    return const MainPage();
                  },

                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                )
              )
            })

            // ignore: invalid_return_type_for_catch_error
            .catchError((error) => {
              print('error $error')
            });
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
