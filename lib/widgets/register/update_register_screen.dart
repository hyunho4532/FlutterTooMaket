import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return PageView (
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: [
        Container(
          color: Colors.blue.withOpacity(0.5),
          child: Center(
            child: Text('첫 번째 페이지',style: TextStyle(fontSize: 50),),
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
}

