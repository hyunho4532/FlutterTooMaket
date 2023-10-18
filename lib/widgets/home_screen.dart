import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _addressController = TextEditingController();
  final GlobalKey<FormState> _addressKey = GlobalKey();
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
    return Scaffold (
      body: Column (
        children: [

          Padding (
            padding: const EdgeInsets.all(20.0),
            child: Form (
              key: _addressKey,
              child: SizedBox (
                width: MediaQuery.of(context).size.width,
                height: 30,

                child: TextFormField (
                  controller: _addressController,
                  decoration: const InputDecoration (
                    hintText: '주소를 입력해주세요',
                    hintStyle: TextStyle (
                      color: Colors.grey,
                    ),
                  ),

                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      fetchAddresses(value);
                    }
                  },
                ),
              ),
            ),
          ),

          ImageSlideshow (
            width: double.infinity,
            height: 200,
            initialPage: 0,
            indicatorColor: Colors.blue,
            indicatorBackgroundColor: Colors.grey,

            onPageChanged: (value) {

            },

            autoPlayInterval: 3000,

            isLoop: true,

            children: [
              const Padding (
                padding: EdgeInsets.all(16.0),
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text (
                      '환영합니다!',
                      style: TextStyle (
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    Text (
                      '중고 제품을 판매하기 위해 주소를 입력해주세요!!',
                      style: TextStyle (
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              Container (

              )
            ],
          ),

          Expanded (
            child: ListView.builder (
              itemCount: addressList.length,
              itemBuilder: (context, index) {
                return ListTile (
                  title: Text(addressList[index]),
                  onTap: () {

                  },
                );
              },
            ),
          )
        ],
      )
    );
  }
}
