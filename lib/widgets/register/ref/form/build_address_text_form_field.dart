import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

typedef AddressCallback = void Function(List<String>);

// ignore: must_be_immutable
class BuildAddressTextFormField extends StatefulWidget {

  AddressCallback onAddressSelected;

  BuildAddressTextFormField({Key? key, required this.onAddressSelected}) : super(key: key);

  @override
  State<BuildAddressTextFormField> createState() => _BuildAddressTextFormFieldState();
}

class _BuildAddressTextFormFieldState extends State<BuildAddressTextFormField> {

  List<String> addressList = [];

  Future<void> fetchAddresses(String query) async {
    final response = await http.get (
        Uri.parse('https://dapi.kakao.com/v2/local/search/address.json?query=$query'),
        headers: {
          'Authorization': 'KakaoAK 4e21750c2b8367ad9b5d31de6b0e8030'
        }
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final documents = data['documents'];

      List<String> addresses = [];
      for (var document in documents) {
        String address = document['address_name'];
        addresses.add(address);
      }

      setState(() {
        addressList = addresses;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Padding (
        padding: const EdgeInsets.all(24.0),
        child: Form (
          child: TextFormField(
            decoration: const InputDecoration(
                hintText: '주소를 입력해주세요',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: InputBorder.none
            ),

            onChanged: (value) {
              fetchAddresses(value);
            },
          ),
        ),
      ),
    );
  }
}
