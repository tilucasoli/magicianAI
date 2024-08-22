import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'package:remix/remix.dart';

import '../theme/tokens.dart';

final class _WButtonVariant extends Variant {
  const _WButtonVariant(String value) : super(value);

  static const primary = _WButtonVariant('primary');
  static const icon = _WButtonVariant('icon');
  static const tag = _WButtonVariant('tag');
}

class WandButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback onPressed;
  final _WButtonVariant variant;

  const WandButton._({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.variant,
  });

  factory WandButton.icon({
    required IconData icon,
    required VoidCallback onPressed,
  }) =>
      WandButton._(
        icon: icon,
        onPressed: onPressed,
        variant: _WButtonVariant.icon,
        label: '',
      );

  factory WandButton.tag({
    required String label,
    required VoidCallback onPressed,
  }) =>
      WandButton._(
        label: label,
        icon: null,
        onPressed: onPressed,
        variant: _WButtonVariant.tag,
      );

  factory WandButton.primary({
    required String label,
    required VoidCallback onPressed,
  }) =>
      WandButton._(
        icon: null,
        label: label,
        onPressed: onPressed,
        variant: _WButtonVariant.primary,
      );

  @override
  Widget build(BuildContext context) {
    return XButton.blank(
      label: label,
      onPressed: onPressed,
      iconLeft: icon,
      style: _style().applyVariant(variant).animate(),
    );
  }
}

Style _style() {
  final button = ButtonSpecUtility.self;
  final tag = _WButtonVariant.tag;
  final icon = _WButtonVariant.icon;
  final primary = _WButtonVariant.primary;

  return Style(
    // container
    button.container.borderRadius.all.ref($wand.radius.radius2),
    button.container.padding.all.ref($wand.space.space2),

    tag(
      button.container.borderRadius.all.ref($wand.radius.radius11),
      button.container.padding.horizontal.ref($wand.space.space3),
      button.label.style.ref($wand.text.regular14),
      button.label.style.color.ref($wand.color.white(2)),
    ),
    (icon | tag)(
      button.container.color.ref($wand.color.white(6)),
      $on.hover(
        button.container.color.ref($wand.color.white(5)),
      ),
    ),
    primary(
      button.container.color.ref($wand.color.accent()),
      button.container.borderRadius.all.ref($wand.radius.radius5),
      button.container.padding.all.ref($wand.space.space4),
      button.label.style.ref($wand.text.semibold14),
      button.label.style.bold(),
      button.label.style.color.ref($wand.color.white()),
      button.flex.mainAxisAlignment.center(),
    ),

    // flex
    button.flex.mainAxisSize.min(),

    // label
    button.label.style.color.white(),

    // icon
    button.icon.color.ref($wand.color.white(2)),
  );
}
