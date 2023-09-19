import 'package:customer_manager/const/animated_text_kit.dart';
import 'package:customer_manager/const/show_address_search_dialog.dart';
import 'package:customer_manager/provider/address_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp (
    MultiProvider (
      providers: [
        ChangeNotifierProvider(create: (context) => AddressSearchProvider())
      ],

      child: const MaterialApp (
        home: RegisterScreen(),
      ),
    )
  );
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
  bool showFourText = false;
  bool showFiveText = false;

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

    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        showFourText = true;
      });
    });

    Future.delayed(const Duration (seconds: 8), () {
      setState(() {
        showFiveText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final showAddressSearchProvider = Provider.of<AddressSearchProvider>(context);
    final selectedAddress = showAddressSearchProvider.selectedAddress;

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
                  child: DefaultTextStyle (
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    child: typerBodyAnimatedText, // 변경 필요
                  ),
                ),

              if (showThreeText)
                Positioned(
                  top: 180,
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

              if (showFourText)
                Positioned(
                  top: 240,
                  left: 20,
                  child: SizedBox(
                    width: 280,
                    height: 40,
                    child: ElevatedButton (
                      onPressed: () {
                        showAddressSearchProvider.setShowDialog(true);
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
                ),

              if (showFiveText)
                Positioned (
                  top: 270,
                  left: 20,

                  child: Padding (
                    padding: const EdgeInsets.only(top: 64.0),
                    child: SizedBox (
                      width: 300,
                      height: 40,

                      child: Text (
                        '주소: $selectedAddress',

                        style: const TextStyle (
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      )
                    ),
                  ),
                ),

              if (showFiveText)
                Positioned(
                  top: 370,
                  left: 20,
                  child: SizedBox(
                      width: 280,
                      height: 40,
                      child: Form (
                        child: TextFormField (
                          decoration: const InputDecoration (
                            hintText: '이메일을 입력해주세요.',
                          ),
                        ),
                      ),
                  ),
                ),

              if (showAddressSearchProvider.showDialog) const AddressSearchDialog(),
            ],
          ),
        ),
      ),
    );
  }
}