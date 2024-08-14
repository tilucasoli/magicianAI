import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import '../theme/tokens.dart';

class WAvatarType extends Variant {
  const WAvatarType(String value) : super('avatar.$value');
  static const ai = WAvatarType('ai');
  static const user = WAvatarType('user');
}

class WandAvatar extends StatelessWidget {
  final Widget child;
  final Variant type;

  const WandAvatar({
    Key? key,
    required this.child,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ai = WAvatarType.ai;
    final user = WAvatarType.user;

    return Box(
      style: Style(
        $box.padding.horizontal.ref($wand.space.space3),
        $box.padding.vertical.ref($wand.space.space2),
        $box.borderRadius.all.ref($wand.radius.radius10),
        $box.color.ref($wand.color.accent()),
        $image.color.ref($wand.color.white()),
        $image.height(16),
        $image.width(16),
        $image.fit.fitHeight(),
        ai(
          $box.color.ref($wand.color.accent()),
        ),
        user(
          $box.color.ref($wand.color.white(4)),
        ),
      ).applyVariant(type),
      child: child,
    );
  }
}
