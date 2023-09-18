import 'package:customer_manager/const/animated_text_kit.dart';
import 'package:customer_manager/const/show_address_search_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: RegisterScreen(),
  ));
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _addressController = TextEditingController();
  List<String> addressResults = []; // 주소 검색 결과를 저장할 리스트

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  bool showSecondText = false;
  bool showThreeText = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showSecondText = true;
      });
    });

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        showThreeText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    ShowAddressSearchDialog showAddressSearchDialog = ShowAddressSearchDialog();

    _addressController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Positioned(
                top: 40,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 100,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                    child: typerTitleAnimatedText, // 변경 필요
                  ),
                ),
              ),

              if (showSecondText)
                Positioned(
                  top: 100,
                  left: 20,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    child: typerBodyAnimatedText, // 변경 필요
                  ),
                ),

              if (showThreeText)
                Positioned(
                  top: 160,
                  left: 20,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: fadeAnimatedText, // 변경 필요
                  ),
                ),

              Positioned(
                top: 300,
                left: 20,
                child: SizedBox(
                  width: 280,
                  height: 40,
                  child: ElevatedButton (
                    onPressed: () {
                      showAddressSearchDialog.showAddressSearchDialog(context);
                    },

                    child: const Text (
                      '내 주소 조회하기',
                      style: TextStyle (
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}