import 'package:customer_manager/widgets/register/ref/button/build_register_finish_button.dart';
import 'package:customer_manager/widgets/register/ref/form/build_email_text_form_field.dart';
import 'package:customer_manager/widgets/register/ref/form/build_password_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  bool isLoginSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Column (
        children: [
          BuildEmailTextFormField (
            emailTextController: _emailTextController,
            onEmailSelected: (email) {
              _emailTextController = email as TextEditingController;
            },
          ),

          BuildPasswordTextFormField (
            passwordTextController: _passwordTextController,
            onPasswordSelected: (password) {
              _passwordTextController = password as TextEditingController;
            },
          ),

          BuildRegisterFinishButton (
            emailTextController: _emailTextController,
            passwordTextController: _passwordTextController,
            addressValues: "",
            nicknameTextController: _emailTextController,
            isRegisterSelected: false,
            isLoginSelected: isLoginSelected,
          ),
        ],
      )
    );
  }
}
