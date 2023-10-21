import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class BuildCircularAvatar extends StatefulWidget {
  const BuildCircularAvatar({Key? key}) : super(key: key);

  @override
  State<BuildCircularAvatar> createState() => _CircularAvatarState();
}

class _CircularAvatarState extends State<BuildCircularAvatar> {
  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.only(top: 32.0),
      child: CircularProfileAvatar (
        'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
        radius: 100,
        backgroundColor: Colors.transparent,
        borderWidth: 10,
        borderColor: Colors.brown,
        elevation: 5.0,
        foregroundColor: Colors.black26,
        cacheImage: true,
        imageFit: BoxFit.cover,
        onTap: () {
          print('');
        },

        showInitialTextAbovePicture: true,
      ),
    );
  }
}
