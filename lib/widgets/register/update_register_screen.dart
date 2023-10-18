import 'package:customer_manager/widgets/register/ref/build_register_title_main.dart';
import 'package:customer_manager/widgets/register/ref/build_register_title_section.dart';
import 'package:customer_manager/widgets/register/ref/build_register_title_sub_main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/utils/form_validation.dart';
import 'package:pretty_button/pretty_button.dart';

class UpdateRegisterScreen extends StatefulWidget {
  const UpdateRegisterScreen({Key? key}) : super(key: key);

  @override
  State<UpdateRegisterScreen> createState() => _UpdateRegisterScreenState();
}

class _UpdateRegisterScreenState extends State<UpdateRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp (
      home: Scaffold (
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
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final ValueNotifier<bool> _isEmailValid = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isPasswordValid = ValueNotifier<bool>(false);

  bool isShowBodyText = false;
  bool isShowSectionText = false;
  bool isShowEmailText = false;
  bool isShowPasswordText = false;
  bool isShowNextButton = false;

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
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: [
        Container(
          child: Stack(
            children: [
              Positioned (
                top: 420,
                left: 0,
                right: 0,
                bottom: 0,
                child: Lottie.asset(
                  'assets/lottie/register.json',
                  width: 270 ,
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
                    if (isShowBodyText) const BuildRegisterSubMainTitle(),
                    if (isShowSectionText) const BuildRegisterSectionTitle(),

                    if (isShowEmailText)
                      Padding (
                        padding: const EdgeInsets.only(top: 60.0, left: 24.0, right: 24.0),
                        child: MaterialTextField (
                          keyboardType: TextInputType.emailAddress,
                          hint: '이메일을 입력해주세요',
                          labelText: 'Email',
                          textInputAction: TextInputAction.next,
                          prefixIcon: const Icon(Icons.email_outlined),
                          controller: _emailTextController,
                          validator: FormValidation.emailTextField,
                        ),
                      ),

                    if (isShowPasswordText)
                      Padding (
                        padding: const EdgeInsets.only(top: 30.0, left: 24.0, right: 24.0),
                        child: MaterialTextField (
                          keyboardType: TextInputType.emailAddress,
                          hint: '패스워드를 입력해주세요',
                          labelText: 'Password',
                          textInputAction: TextInputAction.next,
                          prefixIcon: const Icon(Icons.password_outlined),
                          controller: _passwordTextController,
                          validator: FormValidation.emailTextField,
                        ),
                      ),


                    if (isShowNextButton)

                      Padding (
                        padding: const EdgeInsets.only(top: 24.0, left: 24.0),
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _isEmailValid,
                          builder: (context, isEmailValid, child) {
                            return ValueListenableBuilder<bool>(
                              valueListenable: _isPasswordValid,
                              builder: (context, isPasswordValid, child) {
                                return PrettyButton (
                              
                                  isDisable: false,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  topShadowColor: Theme.of(context).colorScheme.onPrimary,
                                  bottomShadowColor: Theme.of(context).colorScheme.primary,
                                  backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                                  width: 60,
                                  height: 50,
                                  borderRadius: 15,
                                  innerPadding: const EdgeInsets.all(8.0),
                                  outerPadding: const EdgeInsets.all(8.0),
                                  onTap: () {
                                    _isEmailValid.value && _isPasswordValid.value ?
                                    _pageController.animateToPage(
                                        1,
                                        duration: const Duration(seconds: 2),
                                        curve: Curves.easeInOut
                                    )
                                        : null;
                                    },
                                    child: Text('다음',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.primary,
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
        Container(
          color: Colors.orangeAccent.withOpacity(0.5),
          child: const Center(
            child: Text(
              '두 번째 페이지',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
        Container(
          color: Colors.cyanAccent.withOpacity(0.5),
          child: const Center(
            child: Text(
              '세 번째 페이지',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
      ],
    );
  }

  void _showBodyTextDelayed() {
    Future.delayed (const Duration(seconds: 2), () {
      setState(() {
        isShowBodyText = true;
      });
    }
    );
  }

  void _showBodySectionDelayed() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        isShowSectionText = true;
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

