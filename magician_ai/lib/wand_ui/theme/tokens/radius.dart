import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

class WRadiusTokens {
  WRadiusTokens();

  final radius0 = RadiusToken('--radius-0');
  final radius1 = RadiusToken('--radius-1');
  final radius2 = RadiusToken('--radius-2');
  final radius3 = RadiusToken('--radius-3');
  final radius4 = RadiusToken('--radius-4');
  final radius5 = RadiusToken('--radius-5');
  final radius6 = RadiusToken('--radius-6');
  final radius7 = RadiusToken('--radius-7');
  final radius8 = RadiusToken('--radius-8');
  final radius9 = RadiusToken('--radius-9');
  final radius10 = RadiusToken('--radius-10');
  final radius11 = RadiusToken('--radius-11');
}

Map<RadiusToken, Radius> mapRadiusWandTokens() {
  final remix = WRadiusTokens();

  return {
    remix.radius0: Radius.circular(0),
    remix.radius1: Radius.circular(4),
    remix.radius2: Radius.circular(8),
    remix.radius3: Radius.circular(12),
    remix.radius4: Radius.circular(16),
    remix.radius5: Radius.circular(20),
    remix.radius6: Radius.circular(24),
    remix.radius7: Radius.circular(28),
    remix.radius8: Radius.circular(32),
    remix.radius9: Radius.circular(40),
    remix.radius10: Radius.circular(48),
    remix.radius11: Radius.circular(80),
  };
}
