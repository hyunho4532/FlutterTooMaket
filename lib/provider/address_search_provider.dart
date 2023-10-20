import 'package:flutter/foundation.dart';

class AddressProvider with ChangeNotifier {
  List<String> _addressList = [];

  List<String> get addressList => _addressList;

  void setAddresses(List<String> addresses) {
    _addressList = addresses;
  }
}