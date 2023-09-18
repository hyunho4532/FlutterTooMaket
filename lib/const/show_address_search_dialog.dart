import 'package:flutter/material.dart';

class ShowAddressSearchDialog {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _addressController = TextEditingController();
  List<String> _addressResults = [];

  Future<void> _fetchAddressResults(String searchText) async {
    
  }

  void showAddressSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('주소 조회', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
          content: Form(
            key: _formKey, // Form 상태를 관리하기 위한 GlobalKey
            child: SizedBox (
              width: 500,
              height: 500,
              child: Column (
                children: [

                  Row (
                    children: [
                      Expanded (
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: '주소를 입력해주세요 (너무 자세히는 적지 마세요!)',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                          validator: (value) {
                            // 여기에서 주소 유효성 검사를 수행할 수 있습니다.
                            if (value == null || value.isEmpty) {
                              return '주소를 입력하세요';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox (
                        width: 120,
                        height: 30,

                        child: Padding (
                          padding: const EdgeInsets.only(left: 16),
                          child: Expanded (
                            child: ElevatedButton (
                              onPressed: () {

                              },

                              child: const Text (
                                '주소 조회',
                                style: TextStyle (
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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
      },
    );
  }
}