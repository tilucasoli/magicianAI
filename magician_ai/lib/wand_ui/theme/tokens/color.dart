import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

// Inspired by https://snowui.byewind.com/colors

// Token
class WColorTokens {
  WColorTokens();

  final _blackSwatch = ColorSwatchToken.scale('--black', 6);
  final _whiteSwatch = ColorSwatchToken.scale('--white', 6);

  ColorToken white([int? step]) {
    return step == null ? _whiteSwatch : _whiteSwatch[step];
  }

  ColorToken black([int? step]) {
    return step == null ? _blackSwatch : _blackSwatch[step];
  }
}

// Values
class WColors {
  final ColorSwatch<int> swatch;
  const WColors(this.swatch);

  static const white = WColors(_white);
  static const black = WColors(_black);

  static const _black = ColorSwatch(
    0xFF18181B,
    {
      1: Color(0xFF18181B),
      2: Color(0xCC18181B),
      3: Color(0x6618181B),
      4: Color(0x3318181B),
      5: Color(0x1918181B),
      6: Color(0x0C18181B),
    },
  );

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
}

Map<ColorToken, Color> mapColorWandTokens({
  required WColors black,
  required WColors white,
}) {
  final remix = WColorTokens();

  return {
    remix._blackSwatch: black.swatch,
    remix._whiteSwatch: white.swatch,
  };
}
