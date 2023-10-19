import 'package:customer_manager/provider/address_search_provider.dart';
import 'package:customer_manager/widgets/login/login_screen.dart';
import 'package:customer_manager/widgets/register/register_screen.dart';
import 'package:customer_manager/widgets/register/update_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:customer_manager/firebase_options.dart';

void main() async {
  runApp (
    MultiProvider (
      providers: [
        ChangeNotifierProvider(create: (context) => AddressSearchProvider())
      ],

      child: const WelcomeScreen(),
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp (
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeDetailScreen()
    );
  }
}

class WelcomeDetailScreen extends StatefulWidget {
  const WelcomeDetailScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeDetailScreen> createState() => _WelcomeDetailScreenState();
}

class _WelcomeDetailScreenState extends State<WelcomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home: Scaffold (
        body: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding (
              padding: const EdgeInsets.all(20.0),
              child: Lottie.asset('assets/lottie/welcome.json'),
            ),

            const Padding (
              padding: EdgeInsets.only(top: 20.0, left: 24.0),
              child: Text (
                '안녕하세요! 토마켓입니다!',
                style: TextStyle (
                  color: Colors.black,
                  fontSize: 32.0,
                  fontFamily: 'Yeongdeok_Haeparang_KR',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Padding (
              padding: EdgeInsets.only(top: 20.0, left: 24.0),
              child: Text (
                '근처 이웃들과 중고로 물건들을 구매해보세요!',
                style: TextStyle (
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),

            Padding (
              padding: const EdgeInsets.only(top: 50.0, left: 24.0, right: 24.0),
              child: SizedBox (
                width: MediaQuery.of(context).size.width,
                height: 45,

                child: ElevatedButton (
                  onPressed: () {
                    Navigator.push (
                      context,
                      MaterialPageRoute(builder: (context) => const UpdateRegisterScreen()),
                    );
                  },

                  child: const Text (
                    '회원가입하기',
                    style: TextStyle (
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            Padding (
              padding: const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
              child: SizedBox (
                  width: MediaQuery.of(context).size.width,
                  height: 45,

                  child: const Center (
                    child: Text (
                      'or',
                      style: TextStyle (
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),
            ),

            Padding (
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: SizedBox (
                  width: MediaQuery.of(context).size.width,
                  height: 45,

                  child: Center (
                    child: GestureDetector (
                      onTap: () {
                        Navigator.of(context).push (
                            MaterialPageRoute(builder: (context) => LoginScreen())
                        );
                      },

                      child: const Text (
                        '이미 계정이 있으신가요?',
                        style: TextStyle (
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

