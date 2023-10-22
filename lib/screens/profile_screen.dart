import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:customer_manager/widgets/profile/build_circular_avatar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold (
      body: Center (
        child: Column (
          children: [
            BuildCircularAvatar(),
          ],
        ),
      ),
    );
  }
}
