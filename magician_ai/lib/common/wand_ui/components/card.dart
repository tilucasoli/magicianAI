import 'package:flutter/material.dart';
import 'package:magician_ai/common/wand_ui/theme/tokens.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

class WandCard extends StatelessWidget {
  final List<Widget> children;

  const WandCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final card = CardSpecUtility.self;
    return RxBlankCard(
      children: children,
      style: Style(
        card.flex.column(),
        card.flex.crossAxisAlignment.start(),
        card.container.padding.all.ref($wand.space.space4),
        card.container.borderRadius.all.ref($wand.radius.radius5),
        card.container.color.ref($wand.color.white(6)),
        $on.hover(
          card.container.color.ref($wand.color.white(5)),
        ),
      ).animate(duration: const Duration(milliseconds: 100)),
    );
  }
}
