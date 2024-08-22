import 'package:flutter/material.dart';
import 'package:magician_ai/common/wand_ui/components/avatar.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../../../common/wand_ui/theme/tokens.dart';
class ChatBubbleType extends Variant {
  const ChatBubbleType(String value) : super('chatBubble.$value');

  static const ai = ChatBubbleType('ai');
  static const user = ChatBubbleType('user');
}

class ChatBubble extends StatelessWidget {
  final String message;
  final ChatBubbleType type;
  final bool loading;
  final Widget icon;

  const ChatBubble({
    super.key,
    this.loading = false,
    required this.type,
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final avatar = WandAvatar(
      child: loading
          ? RxSpinnerSpecWidget(
              spec: SpinnerSpec(color: $wand.color.white().resolve(context)),
            )
          : icon,
      type: type == ChatBubbleType.ai ? WAvatarType.ai : WAvatarType.user,
    );

    return StyledFlex(
      style: _style().applyVariant(type),
      direction: Axis.horizontal,
      children: type == ChatBubbleType.ai
          ? [
              avatar,
              StyledText(message),
            ]
          : [
              Box(
                inherit: true,
                child: StyledText(message),
              ),
              avatar,
            ],
    );
  }

  Style _style() {
    const ai = ChatBubbleType.ai;
    const user = ChatBubbleType.user;

    return Style(
      user(
        $box.padding.horizontal.ref($wand.space.space4),
        $box.padding.vertical.ref($wand.space.space3),
        $box.borderRadius.all.ref($wand.radius.radius5),
        $box.color.ref($wand.color.white(6)),
        $box.wrap.flexible(),
        $flex.mainAxisAlignment.end(),
      ),
      ai(
        $flex.mainAxisAlignment.start(),
        $text.wrap.expanded(),
      ),
      $with.padding.bottom.ref($wand.space.space9),
      $text.style.ref($wand.text.regular16),
      $text.style.color.ref($wand.color.white(2)),
      $flex.gap.ref($wand.space.space4),
      $flex.crossAxisAlignment.start(),
    );
  }
}
