import 'package:customer_manager/const/register_animated_text_kit.dart';
import 'package:customer_manager/widgets/register/ref/build_register_main_title.dart';
import 'package:customer_manager/widgets/register/ref/build_register_title_section.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
  bool isShowBodyText = false;

  @override
  void initState() {
    super.initState();

    _showBodyTextDelayed();
  }

  @override
  Widget build(BuildContext context) {
    return PageView (
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: [
        Container (
          child: Column (
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const BuildRegisterMainTitle(),



              if (isShowBodyText)
                const BuildRegisterSectionTitle(),

              Lottie.asset('assets/lottie/register.json', width: MediaQuery.of(context).size.width),
            ],
          ),
        ),
        Container(
          color: Colors.orangeAccent.withOpacity(0.5),
          child: Center(
            child: Text('두 번째 페이지',style: TextStyle(fontSize: 50),),
          ),
        ),
        Container(
          color: Colors.cyanAccent.withOpacity(0.5),
          child: Center(
            child: Text('세 번째 페이지',style: TextStyle(fontSize: 50),),
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
}

