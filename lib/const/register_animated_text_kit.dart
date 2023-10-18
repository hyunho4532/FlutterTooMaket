import 'package:animated_text_kit/animated_text_kit.dart';

AnimatedTextKit typerTitleAnimatedText = AnimatedTextKit (
  repeatForever: false,
  totalRepeatCount: 1,
  animatedTexts: [
    TyperAnimatedText('Hello~! 토마켓!!', speed: const Duration(milliseconds: 100)),
  ],
);

AnimatedTextKit typerBodyAnimatedText = AnimatedTextKit (
  repeatForever: false,
  totalRepeatCount: 1,
  animatedTexts: [
    TyperAnimatedText('물품을 거래하기 위해 회원가입을 진행해주세요!', speed: const Duration(milliseconds: 50)),
  ],
);

AnimatedTextKit fadeAnimatedText = AnimatedTextKit (
  repeatForever: false,
  totalRepeatCount: 1,
  animatedTexts: [
    WavyAnimatedText('이메일과 패스워드는 안전한 곳에 보관해둘거에요!!', speed: const Duration(milliseconds: 50)),
  ],
);