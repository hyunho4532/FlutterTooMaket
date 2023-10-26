import 'package:customer_manager/repository/product_repository.dart';
import 'package:customer_manager/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

final auth = FirebaseAuth.instance;

void firebaseAuthLogin(email, password, context) {

  auth.signInWithEmailAndPassword(
    email: email,
    password: password,
  ).then((value) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, Animation<double> animation1, Animation<double> animation2) {
          return const MainPage();
        },
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  });
}

void firebaseAuthRegister(email, password, address, nickname, context) {
  auth.createUserWithEmailAndPassword (
    email: email,
    password: password,
  ).then((value) {

    UserRepository userRepository = UserRepository();
    userRepository.insertUsers(address, nickname, auth.currentUser!.uid.toString());

    Navigator.push (
      context,
      PageRouteBuilder (
        pageBuilder: (context, Animation<double> animation1, Animation<double> animation2) {
          return const MainPage();
        },

        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      )
    );
  });
}