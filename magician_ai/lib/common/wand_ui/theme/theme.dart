import 'package:magician_ai/common/wand_ui/theme/tokens/color.dart';
import 'package:magician_ai/common/wand_ui/theme/tokens/radius.dart';
import 'package:magician_ai/common/wand_ui/theme/tokens/space.dart';
import 'package:magician_ai/common/wand_ui/theme/tokens/text_style.dart';
import 'package:mix/mix.dart';

class WandTheme {
  final lightTheme = MixThemeData(
    colors: mapColorWandTokens(
      black: WColors.black,
      white: WColors.white,
      accent: WColors.accent,
    ),
    spaces: mapSpaceWandTokens(),
    radii: mapRadiusWandTokens(),
    textStyles: mapTextStyleWandTokens(),
  );
}
