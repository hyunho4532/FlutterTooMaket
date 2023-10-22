import 'package:flutter/foundation.dart';

class BodyTextVisibleProvider extends ChangeNotifier {
  bool _isShowBodyText = false;
  bool _isShowSectionText = false;

  bool get isShowBodyText => _isShowBodyText;
  bool get isShowSectionText => _isShowSectionText;

  void setIsShowBodyText(bool isShowBodyText) {
    _isShowBodyText = isShowBodyText;
  }

  void setIsShowSectionText(bool isShowSectionText) {
    _isShowSectionText = isShowSectionText;
  }
}