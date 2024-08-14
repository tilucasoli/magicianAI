import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

// Inspired by https://snowui.byewind.com/colors

// Token
class WColorTokens {
  WColorTokens();

  final black = ColorToken('--black');
  final _accentSwatch = ColorSwatchToken.scale('--accent', 2);
  final _whiteSwatch = ColorSwatchToken.scale('--white', 6);

  ColorToken white([int? step]) {
    return step == null ? _whiteSwatch : _whiteSwatch[step];
  }

  ColorToken accent([int? step]) {
    return step == null ? _accentSwatch : _accentSwatch[step];
  }
}

// Values
class WColors {
  final ColorSwatch<int> swatch;
  const WColors(this.swatch);

  static const white = WColors(_white);
  static const black = Color(0xFF171717);
  static const accent = WColors(_accent);

  static const _white = ColorSwatch(
    0xFFFFFFFF,
    {
      1: Color(0xFFFFFFFF),
      2: Color(0xCCFFFFFF),
      3: Color(0x66FFFFFF),
      4: Color(0x33FFFFFF),
      5: Color(0x19FFFFFF),
      6: Color(0x0CFFFFFF),
    },
  );

  static const _accent = ColorSwatch(
    0xFF6A4CFF,
    {
      1: Color(0xFF6A4CFF),
      2: Color(0xFF9580FF),
    },
  );
}

Map<ColorToken, Color> mapColorWandTokens({
  required Color black,
  required WColors white,
  required WColors accent,
}) {
  final remix = WColorTokens();

  return {
    remix.black: black,
    remix._accentSwatch: accent.swatch,
    remix._whiteSwatch: white.swatch,
  };
}
