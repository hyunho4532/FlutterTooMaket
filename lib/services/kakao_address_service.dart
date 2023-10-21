import 'package:http/http.dart' as http;
import 'dart:convert';
import '../provider/address_search_provider.dart';

class KaKaoAddressService {
  AddressProvider addressProvider = AddressProvider();

  Future<void> fetchAddresses(String query, Function(List<String>) callback) async {
    final response = await http.get(
      Uri.parse(
          'https://dapi.kakao.com/v2/local/search/address.json?query=$query'),
      headers: {
        'Authorization': 'KakaoAK 4e21750c2b8367ad9b5d31de6b0e8030'
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final documents = data['documents'];

      List<String> addresses = [];
      for (var document in documents) {
        String address = document['address_name'];
        addresses.add(address);
      }

      callback(addresses);
    }
  }
}