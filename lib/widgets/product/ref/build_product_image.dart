import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_platform_interface/src/types/picked_file/unsupported.dart';

// ignore: must_be_immutable
class BuildProductImage extends StatefulWidget {

  PickedFile? image;

  BuildProductImage({Key? key, required this.image}) : super(key: key);

  @override
  State<BuildProductImage> createState() => _BuildProductImageState();
}

class _BuildProductImageState extends State<BuildProductImage> {
  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.only(left: 24.0, top: 16.0),
      child: SizedBox (
        width: 140,
        height: 140,
        child: widget.image == null
            ? const Text('이미지를 선택해주세요 .')
            : Card(
          child: Image.file(File(widget.image!.path), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
