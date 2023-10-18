import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    TyperAnimatedText('근처 이웃들과 함께 \n물품을 거래하기 위해 회원가입을 진행해주세요!', speed: const Duration(milliseconds: 100)),
  ],
);

AnimatedTextKit fadeAnimatedText = AnimatedTextKit (
  repeatForever: false,
  totalRepeatCount: 1,
  animatedTexts: [
    WavyAnimatedText('이메일과 패스워드는 안전한 곳에 보관해둘거에요!!', speed: const Duration(milliseconds: 80)),
  ],
);

Widget _buildTitleSection =
  Padding (
    padding: const EdgeInsets.only(left: 24.0, top: 48.0),
    child: DefaultTextStyle (
      style: const TextStyle (
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      child: typerTitleAnimatedText,
    ),
  );