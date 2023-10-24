import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class ProductInsertScreen extends StatefulWidget {
  const ProductInsertScreen({Key? key}) : super(key: key);

  @override
  State<ProductInsertScreen> createState() => _ProductInsertScreenState();
}

class _ProductInsertScreenState extends State<ProductInsertScreen> {
  final picker = ImagePicker();
  PickedFile? _image;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedFile;
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
            color: Colors.black,
          ),
        ),
        actions: const [
          Column (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Padding (
                padding: EdgeInsets.only(right: 8.0),
                child: Text (
                  '확인',
                  style: TextStyle (
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )
        ],
        backgroundColor: Colors.white70,
      ),

      body: SingleChildScrollView (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            GestureDetector (
              onTap: () {
                getImage();
              },

              child: const Padding (
                padding: EdgeInsets.only(left: 24.0, top: 30),
                child: SizedBox (
                  width: 60,
                  height: 60,

                  child: Card (
                    child: Icon(Icons.camera_alt, color: Colors.grey),
                  ),
                ),
              ),
            ),

            Padding (
              padding: const EdgeInsets.only(left: 24.0, top: 16.0),
              child: SizedBox (
                width: 140,
                height: 140,
                child: _image == null
                    ? const Text('이미지를 선택해주세요 .')
                    : Card (
                  child: Image.file(File(_image!.path), fit: BoxFit.cover),
                ),
              ),
            ),

            Padding (
              padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
              child: TextFormField (
                controller: _titleController,
                decoration: const InputDecoration (
                  hintText: '제목을 입력해주세요.',
                ),
              ),
            ),

            Padding (
              padding: const EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0),
              child: TextFormField (
                controller: _priceController,
                decoration: const InputDecoration (
                  hintText: '가격을 정해주세요.',
                ),
              ),
            ),

            Padding (
              padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0, bottom: 36.0),
              child: TextFormField (
                controller: _addressController,
                decoration: const InputDecoration (
                  hintText: '주소를 입력해주세요.',
                ),
              ),
            ),

            Padding (
                padding: const EdgeInsets.only(left: 24.0, top: 6.0, right: 120.0),
                child: MultiSelectDropDown (
                  onOptionSelected: (List<ValueItem> selectedOptions) {

                  },

                  options: const [
                    ValueItem (
                      label: '스포츠', value: '스포츠',
                    ),

                    ValueItem (
                      label: '전자기기/부품', value: '전자기기/부품',
                    ),

                    ValueItem (
                      label: '피부/미용', value: '피부/미용',
                    ),

                    ValueItem (
                      label: '가구', value: '가구',
                    ),

                    ValueItem (
                      label: '기타', value: '기타',
                    ),
                  ],

                  selectionType: SelectionType.single,
                  chipConfig: const ChipConfig (
                      wrapType: WrapType.wrap
                  ),

                  dropdownHeight: 300,

                  optionTextStyle: const TextStyle (
                      fontSize: 16
                  ),

                  selectedOptionIcon: const Icon(Icons.check_circle),
                )
            ),
          ],
        ),
      ),
    );
  }
}
