import 'package:magician_ai/common/wand_ui/theme/tokens/color.dart';
import 'package:magician_ai/common/wand_ui/theme/tokens/radius.dart';
import 'package:magician_ai/common/wand_ui/theme/tokens/space.dart';
import 'package:magician_ai/common/wand_ui/theme/tokens/text_style.dart';

class WTokens {
  final color = WColorTokens();
  final space = WSpaceTokens();
  final radius = WRadiusTokens();
  final text = WTextStyleTokens();
}

final $wand = WTokens();
