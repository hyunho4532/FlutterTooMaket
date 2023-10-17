import 'package:animated_text_kit/animated_text_kit.dart';

AnimatedTextKit typerTitleAnimatedText = AnimatedTextKit (
  repeatForever: false,
  totalRepeatCount: 1,
  animatedTexts: [
    TyperAnimatedText('만나서 반갑습니다!!', speed: const Duration(milliseconds: 100)),
  ],
);

AnimatedTextKit typerBodyAnimatedText = AnimatedTextKit (
  repeatForever: false,
  totalRepeatCount: 1,
  animatedTexts: [
    TyperAnimatedText('근처 이웃들과 함께 \n물품을 거래하기 위해 회원가입을 진행해주세요!', speed: const Duration(milliseconds: 40)),
  ],
);

AnimatedTextKit fadeAnimatedText = AnimatedTextKit (
  repeatForever: false,
  totalRepeatCount: 1,
  animatedTexts: [
    WavyAnimatedText('시작하기 전에 회원가입을 진행해주세요!', speed: const Duration(milliseconds: 80)),
  ],
);