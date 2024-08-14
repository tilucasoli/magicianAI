import 'package:mix/mix.dart';

class WSpaceTokens {
  WSpaceTokens();
  final space0 = SpaceToken('--space-0');
  final space1 = SpaceToken('--space-1');
  final space2 = SpaceToken('--space-2');
  final space3 = SpaceToken('--space-3');
  final space4 = SpaceToken('--space-4');
  final space5 = SpaceToken('--space-5');
  final space6 = SpaceToken('--space-6');
  final space7 = SpaceToken('--space-7');
  final space8 = SpaceToken('--space-8');
  final space9 = SpaceToken('--space-9');
  final space10 = SpaceToken('--space-10');
  final space11 = SpaceToken('--space-11');
}

Map<SpaceToken, double> mapSpaceWandTokens() {
  final tokens = WSpaceTokens();

  return {
    tokens.space0: 0,
    tokens.space1: 4,
    tokens.space2: 8,
    tokens.space3: 12,
    tokens.space4: 16,
    tokens.space5: 20,
    tokens.space6: 24,
    tokens.space7: 28,
    tokens.space8: 32,
    tokens.space9: 40,
    tokens.space10: 48,
    tokens.space11: 80,
  };
}
