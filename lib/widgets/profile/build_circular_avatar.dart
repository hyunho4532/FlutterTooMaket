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
    return CircularProfileAvatar (
      'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
      radius: 100,
      backgroundColor: Colors.transparent,
      borderWidth: 10,
      borderColor: Colors.brown,
      elevation: 5.0,
      foregroundColor: Colors.brown.withOpacity(0.5),
      cacheImage: true,
      imageFit: BoxFit.cover,
      onTap: () {
        
      },

      showInitialTextAbovePicture: true,
    );
  }
}
