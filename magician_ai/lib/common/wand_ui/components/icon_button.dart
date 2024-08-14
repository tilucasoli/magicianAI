import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'package:remix/remix.dart';

import '../theme/tokens.dart';

class WandIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const WandIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = ButtonSpecUtility.self;

    return RxBlankButton(
      label: '',
      onPressed: onPressed,
      iconLeft: icon,
      style: Style(
        button.flex.row(),
        button.flex.mainAxisSize.min(),
        button.label.style.color.white(),
        button.container.padding.all(8),
        button.icon.color.ref($wand.color.white(2)),
        button.container.borderRadius.all.ref(
          $wand.radius.radius2,
        ),
        button.container.color.ref($wand.color.white(6)),
        $on.hover(
          button.container.color.ref($wand.color.white(5)),
        ),
      ).animate(duration: Duration(milliseconds: 100)),
    );
  }
}
