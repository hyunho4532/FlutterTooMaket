import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductInsertScreen extends StatefulWidget {
  const ProductInsertScreen({Key? key}) : super(key: key);

  @override
  State<ProductInsertScreen> createState() => _ProductInsertScreenState();
}

class _ProductInsertScreenState extends State<ProductInsertScreen> {
  final picker = ImagePicker();
  PickedFile? _image;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedFile as PickedFile?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: const Text (
          '중고 물품 등록하기',
          style: TextStyle (
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),

      body: Center (
        child: _image == null
            ? const Text ('이미지를 등록해주세요')
            : Image.file(File(_image!.path)),
      ),
    );
  }
}
