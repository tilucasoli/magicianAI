import 'package:mix/mix.dart';

import '../modifiers/linear_gradient.dart';

extension ModifiersUtilityExt on ModifierUtility {
  LinearGradientModifierSpecUtility get linearGradient =>
      LinearGradientModifierSpecUtility(only);
}
