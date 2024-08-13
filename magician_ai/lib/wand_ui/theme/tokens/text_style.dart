import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:google_fonts/google_fonts.dart';

class WTextStyleTokens {
  WTextStyleTokens();

  final regular12 = TextStyleToken('--regular-12');
  final semibold12 = TextStyleToken('--semibold-12');
  final regular14 = TextStyleToken('--regular-14');
  final semibold14 = TextStyleToken('--semibold-14');

  final regular16 = TextStyleToken('--regular-16');
  final semibold16 = TextStyleToken('--semibold-16');

  final regular24 = TextStyleToken('--regular-24');
  final semibold24 = TextStyleToken('--semibold-24');

  final regular32 = TextStyleToken('--regular-32');
  final semibold32 = TextStyleToken('--semibold-32');

  final regular48 = TextStyleToken('--regular-48');
  final semibold48 = TextStyleToken('--semibold-48');

  final regular64 = TextStyleToken('--regular-64');
  final semibold64 = TextStyleToken('--semibold-64');
}

Map<TextStyleToken, TextStyle> mapTextStyleWandTokens() {
  final tokens = WTextStyleTokens();

  final regular12 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );

  final regular14 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );

  final regular16 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
  );

  final regular24 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
  );

  final regular32 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
    ),
  );

  final regular48 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
  );

  final regular64 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w400,
    ),
  );

  return {
    tokens.regular12: regular12,
    tokens.semibold12: regular12.copyWith(
      fontWeight: FontWeight.w600,
    ),
    tokens.regular14: regular14,
    tokens.semibold14: regular14.copyWith(
      fontWeight: FontWeight.w600,
    ),
    tokens.regular16: regular16,
    tokens.semibold16: regular16.copyWith(
      fontWeight: FontWeight.w600,
    ),
    tokens.regular24: regular24,
    tokens.semibold24: regular24.copyWith(
      fontWeight: FontWeight.w600,
    ),
    tokens.regular32: regular32,
    tokens.semibold32: regular32.copyWith(
      fontWeight: FontWeight.w600,
    ),
    tokens.regular48: regular48,
    tokens.semibold48: regular48.copyWith(
      fontWeight: FontWeight.w600,
    ),
    tokens.regular64: regular64,
    tokens.semibold64: regular64.copyWith(
      fontWeight: FontWeight.w600,
    ),
  };
}
