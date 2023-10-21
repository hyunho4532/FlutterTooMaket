import 'package:flutter/material.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/utils/form_validation.dart';

typedef PasswordControllerCallback = void Function(String);

// ignore: must_be_immutable
class BuildPasswordTextFormField extends StatefulWidget {

  TextEditingController passwordTextController;

  final PasswordControllerCallback onPasswordSelected;

  BuildPasswordTextFormField({Key? key, required this.passwordTextController, required this.onPasswordSelected}) : super(key: key);

  @override
  State<BuildPasswordTextFormField> createState() => _BuildPasswordTextFormFieldState();
}

class _BuildPasswordTextFormFieldState extends State<BuildPasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 30.0, left: 24.0, right: 24.0),
      child: MaterialTextField(
        keyboardType: TextInputType.emailAddress,
        hint: '패스워드를 입력해주세요',
        labelText: 'Password',
        textInputAction: TextInputAction.next,
        prefixIcon: const Icon(Icons.password_outlined),
        controller: widget.passwordTextController,
        validator: FormValidation.emailTextField,
      ),
    );
  }
}
