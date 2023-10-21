import 'package:customer_manager/provider/body_text_visible_provider.dart';

BodyTextVisibleProvider bodyTextVisibleProvider = BodyTextVisibleProvider();

class AddressFutureDelayed {
  void showBodyText() {
    Future.delayed(const Duration(seconds: 2), () {
      bodyTextVisibleProvider.setIsShowBodyText(true);
    });
  }
}