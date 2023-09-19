import 'package:customer_manager/provider/address_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

class ShowAddressSearchDialog {

  void showAddressSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddressSearchDialog();
      },
    );
  }
}

class AddressSearchDialog extends StatefulWidget {

  const AddressSearchDialog({Key? key}) : super(key: key);

  @override
  State<AddressSearchDialog> createState() => _AddressSearchDialogState();
}

class _AddressSearchDialogState extends State<AddressSearchDialog> {

  TextEditingController _addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> addressResults = [];

  Future<void> _fetchAddressResults(String searchText) async {
    const String Api_Key = '4e21750c2b8367ad9b5d31de6b0e8030';

    final String Api_Url = 'https://dapi.kakao.com/v2/local/search/address.json?query=$searchText';

    final response = await http.get(Uri.parse(Api_Url), headers: {
      'Authorization': 'KakaoAK $Api_Key',
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final documents = jsonData['documents'];

      List<String> results = [];

      for (var document in documents) {
        results.add(document['address_name']);
      }

      setState(() {
        addressResults = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('주소 조회', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
      content: Form(
        key: _formKey, // Form 상태를 관리하기 위한 GlobalKey
        child: SizedBox (
          width: 800,
          height: 800,
          child: Column (
            children: [

              Row (
                children: [
                  Expanded (
                    child: TextFormField (
                      decoration: const InputDecoration(
                        hintText: '주소를 입력해주세요 (ex: 서울 강동구)',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),

                      onChanged: (value) {
                        _fetchAddressResults(value);
                      },

                      validator: (value) {
                        // 여기에서 주소 유효성 검사를 수행할 수 있습니다.
                        if (value == null || value.isEmpty) {
                          return '주소를 입력하세요';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              Expanded (
                child: Padding (
                  padding: const EdgeInsets.only(top: 24.0),
                  child: ListView.builder (
                    itemCount: addressResults.length,
                    itemBuilder: (context, index) {
                      return GestureDetector (
                        onTap: () {
                          final addressSearchProvider =
                              Provider.of<AddressSearchProvider>(context, listen: false);

                          addressSearchProvider.selectedAddress = addressResults[index];

                          addressSearchProvider.closeDialog();
                        },

                        child: ListTile (
                          title: Text(addressResults[index]),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // 폼 유효성 검사를 수행합니다.
            if (_formKey.currentState!.validate()) {
              // 주소 조회 완료 동작을 수행합니다.
              // 이 때 폼의 데이터는 _formKey.currentState를 통해 접근 가능합니다.
            }
          },
          child: const Text('주소 조회 완료'),
        )
      ],
    );
  }
}
