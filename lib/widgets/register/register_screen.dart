import 'package:customer_manager/provider/address_search_provider.dart';
import 'package:customer_manager/provider/body_text_visible_provider.dart';
import 'package:customer_manager/services/kakao_address_service.dart';
import 'package:customer_manager/widgets/register/ref/button/build_register_finish_button.dart';
import 'package:customer_manager/widgets/register/ref/button/build_register_prev_button.dart';
import 'package:customer_manager/widgets/register/ref/build_register_title_main.dart';
import 'package:customer_manager/widgets/register/ref/build_register_title_section.dart';
import 'package:customer_manager/widgets/register/ref/build_register_title_sub_main.dart';
import 'package:customer_manager/widgets/register/ref/form/build_email_text_form_field.dart';
import 'package:customer_manager/widgets/register/ref/form/build_password_text_form_field.dart';
import 'package:customer_manager/widgets/register/ref/listview/build_register_list_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pretty_button/pretty_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: PageViewRegisterWidget(),
      ),
    );
  }
}

class PageViewRegisterWidget extends StatefulWidget {
  const PageViewRegisterWidget({Key? key}) : super(key: key);

  @override
  State<PageViewRegisterWidget> createState() => _PageViewRegisterWidgetState();
}

class _PageViewRegisterWidgetState extends State<PageViewRegisterWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  late TextEditingController _emailTextController = TextEditingController();
  late TextEditingController _passwordTextController = TextEditingController();
  final ValueNotifier<bool> _isEmailValid = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isPasswordValid = ValueNotifier<bool>(false);

  KaKaoAddressService addressService = KaKaoAddressService();
  BodyTextVisibleProvider bodyTextVisibleProvider = BodyTextVisibleProvider();

  bool isShowEmailText = false;
  bool isShowPasswordText = false;
  bool isShowNextButton = false;

  List<String> addressList = [];

  String addressValues = "";

  AddressProvider addressProvider = AddressProvider();

  void updateAddressList(List<String> addresses) {
    setState(() {
      addressProvider.setAddresses(addresses);
    });
  }

  @override
  void initState() {
    super.initState();

    _showBodyTextDelayed();
    _showBodySectionDelayed();
    _showBodyEmailAndPasswordTextDelayed();
    _showBodyNextButtonDelayed();

    _emailTextController.addListener(() {
      _isEmailValid.value = _emailTextController.text.isNotEmpty;
    });

    _passwordTextController.addListener(() {
      _isPasswordValid.value = _passwordTextController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView (
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: [
        Expanded (
          child: Stack (
            children: [
              Positioned(
                top: 420,
                left: 0,
                right: 0,
                bottom: 0,
                child: Lottie.asset(
                  'assets/lottie/register.json',
                  width: 270,
                  fit: BoxFit.fill, // or BoxFit.cover based on your preference
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BuildRegisterMainTitle(),
                    if (bodyTextVisibleProvider.isShowBodyText) const BuildRegisterSubMainTitle(),
                    if (bodyTextVisibleProvider.isShowSectionText) const BuildRegisterSectionTitle(),

                    if (isShowEmailText)
                      BuildEmailTextFormField (
                        emailTextController: _emailTextController,
                        onEmailSelected: (email) {
                          setState(() {
                            _emailTextController = email as TextEditingController;
                          });
                        }
                      ),

                    if (isShowPasswordText)
                      BuildPasswordTextFormField (
                        passwordTextController: _passwordTextController,
                        onPasswordSelected: (password) {
                          _passwordTextController = password as TextEditingController;
                        }
                      ),

                    if (isShowNextButton)
                      Padding (
                        padding: const EdgeInsets.only(top: 24.0, left: 12.0),
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _isEmailValid,
                          builder: (context, isEmailValid, child) {
                            return ValueListenableBuilder<bool>(
                              valueListenable: _isPasswordValid,
                              builder: (context, isPasswordValid, child) {
                                return PrettyButton(
                                  isDisable: false,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  topShadowColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  bottomShadowColor:
                                      Theme.of(context).colorScheme.primary,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant,
                                  width: 60,
                                  height: 50,
                                  borderRadius: 15,
                                  innerPadding: const EdgeInsets.all(8.0),
                                  outerPadding: const EdgeInsets.all(8.0),
                                  onTap: () {
                                    _isEmailValid.value &&
                                            _isPasswordValid.value
                                        ? _pageController.animateToPage(1,
                                            duration:
                                                const Duration(seconds: 2),
                                            curve: Curves.easeInOut)
                                        : null;
                                  },
                                  child: Text(
                                    '다음',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),

        Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Padding (
              padding: EdgeInsets.only(left: 24.0, top: 48.0),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                child: Text(
                  '마지막으로 주소를 입력해주세요!!',
                ),
              ),
            ),

            SingleChildScrollView (
              child: Padding (
                padding: const EdgeInsets.all(24.0),
                child: Form (
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: '주소를 입력해주세요',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none
                    ),

                    onChanged: (value) {
                      addressService.fetchAddresses(value, updateAddressList);
                    },
                  ),
                ),
              ),
            ),

            BuildRegisterListView (
              addressList: addressProvider.addressList,
              addressValues: addressValues,
              onAddressSelected: (address) {
                setState(() {
                  addressValues = address;
                });
              },
            ),

            Padding (
              padding: const EdgeInsets.only(top: 48.0, left: 16.0),
              child: Text (
                '주소: $addressValues',
                style: const TextStyle (
                  color: Colors.black,
                  fontSize: 18.0,
                  fontFamily: 'DNF_KR',
                ),
              ),
            ),

            Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildRegisterPrevButton(pageController: _pageController),
                BuildRegisterFinishButton(emailTextController: _emailTextController, passwordTextController: _passwordTextController),
              ],
            ),
          ],
        ),
      ],
    );
  }

  void _showBodyTextDelayed() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        bodyTextVisibleProvider.setIsShowBodyText(true);
      });
    });
  }

  void _showBodySectionDelayed() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        bodyTextVisibleProvider.setIsShowSectionText(true);
      });
    });
  }

  void _showBodyEmailAndPasswordTextDelayed() {
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        isShowEmailText = true;
        isShowPasswordText = true;
      });
    });
  }

  void _showBodyNextButtonDelayed() {
    Future.delayed(const Duration(seconds: 8), () {
      setState(() {
        isShowNextButton = true;
      });
    });
  }
}
