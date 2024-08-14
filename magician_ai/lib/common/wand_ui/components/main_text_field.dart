import 'package:flutter/widgets.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:magician_ai/common/wand_ui/theme/tokens.dart';
import 'package:magician_ai/common/wand_ui/utils/extensions/modifiers.dart';
import 'package:magician_ai/common/wand_ui/utils/modifiers/linear_gradient.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import 'dropdown.dart';

class MainInput extends StatelessWidget {
  const MainInput({super.key});

  @override
  Widget build(BuildContext context) {
    final card = CardSpecUtility.self;

    return RxBlankCard(
      style: Style(
        card.container.borderRadius.all.ref($wand.radius.radius4),
        card.container.color.ref($wand.color.black),
        card.container.padding.all.ref($wand.space.space4),
        card.flex.mainAxisSize.min(),
        card.flex.crossAxisAlignment.start(),
        card.flex.mainAxisAlignment.start(),
        card.flex.gap(16),
      ),
      children: [
        StyledRow(
          style: Style(
            $flex.gap(16),
            $flex.mainAxisSize.min(),
          ),
          children: [
            // Add as a decorator
            StyledIcon(
              LucideIcons.sparkles,
              style: Style(
                $with.linearGradient.colors([
                  Color(0xFFC080FF),
                  Color(0xFF8372F7),
                ]),
                $icon.color.ref($wand.color.white(2)),
              ),
            ),
            StyledText(
              "A minimalist blog post template",
              style: Style(
                $text.style.ref($wand.text.regular16),
                $text.style.color.ref($wand.color.white(2)),
              ),
            ),
          ],
        ),
        StyledRow(
          style: Style(
            $flex.gap(16),
            $flex.mainAxisSize.min(),
          ),
          children: [
            WandDropdown(),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
