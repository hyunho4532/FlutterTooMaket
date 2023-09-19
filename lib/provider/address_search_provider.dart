import 'package:flutter/material.dart';

class AddressSearchProvider with ChangeNotifier {
  String? selectedAddress;

  bool _showDialog = false;

  bool get showDialog => _showDialog;

  void setShowDialog(bool value) {
    _showDialog = value;
    notifyListeners();
  }

  void closeDialog() {
    _showDialog = false;
    notifyListeners();
  }
}