import 'package:customer_manager/repository/product_repository.dart';
import 'package:customer_manager/widgets/profile/build_circular_avatar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String userName = '';

  ProductRepository productRepository = ProductRepository();

  @override
  void initState() {
    super.initState();

    productRepository.getUser()
      .then((snapshot) {
        var data = snapshot.data();

        setState(() {
          userName = data?['nickname'];
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Row (
              children: [
                const BuildCircularAvatar(),

                Text (
                  userName,
                  style: const TextStyle (
                    color: Colors.black87,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
