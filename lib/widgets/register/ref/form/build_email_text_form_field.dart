import 'package:flutter/material.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/utils/form_validation.dart';

typedef EmailControllerCallback = void Function(String);

// ignore: must_be_immutable
class BuildEmailTextFormField extends StatefulWidget {

  TextEditingController emailTextController;
  final EmailControllerCallback onEmailSelected;

  BuildEmailTextFormField({Key? key, required this.emailTextController, required this.onEmailSelected}) : super(key: key);

  @override
  State<BuildEmailTextFormField> createState() => _BuildEmailTextFormFieldState();
}

class _BuildEmailTextFormFieldState extends State<BuildEmailTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 60.0, left: 24.0, right: 24.0),
      child: MaterialTextField (
        keyboardType: TextInputType.emailAddress,
        hint: '이메일을 입력해주세요',
        labelText: 'Email',
        textInputAction: TextInputAction.next,
        prefixIcon: const Icon(Icons.email_outlined),
        controller: widget.emailTextController,
        validator: FormValidation.emailTextField,
      ),
    );
  }
}
