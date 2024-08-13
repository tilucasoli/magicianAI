import 'package:flutter/material.dart';
import 'package:magician_ai/wand_ui/components/main_text_field.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../../wand_ui/components/text_field.dart';
import '../../wand_ui/theme/tokens/tokens.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final badge = BadgeSpecUtility.self;
    return ZBox(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 200, top: 90),
          child: VBox(
            style: Style(
              $flex.mainAxisSize.max(),
              $flex.mainAxisAlignment.start(),
              $flex.crossAxisAlignment.start(),
            ),
            children: [
              StyledText(
                'What\'s a container in Flutter ?',
                style: Style(
                  $text.style.ref($wand.text.semibold32),
                  $text.style.fontWeight.bold(),
                  $text.style.color.ref($wand.color.black()),
                ),
              ),
              SizedBox(height: 8),
              RxBlankBadge(
                label: 'llama3',
                style: Style(
                  badge.container.borderRadius.all.ref($wand.radius.radius4),
                  badge.container.color.deepPurpleAccent(),
                  badge.container.padding.horizontal.ref($wand.space.space3),
                  badge.container.padding.vertical.ref($wand.space.space1),
                  badge.label.style.ref($wand.text.semibold16),
                  badge.label.style.color.ref($wand.color.white()),
                ),
              ),
              SizedBox(height: 32),
              StyledText(
                'In Flutter, a "container" is a widget that combines common painting, positioning, and sizing widgets. It\'s essentially a convenience widget that wraps around other widgets like BoxDecoration, Padding, Transform, etc., allowing developers to apply these properties in a single, cohesive unit. Containers can be used to style and position child widgets within them, making it easier to manage layout and appearance without having to nest multiple widgets together.',
                style: Style(
                  $text.style.ref($wand.text.semibold16),
                  $text.style.fontWeight.bold(),
                  $text.style.color.ref($wand.color.black(2)),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: WardTextField(),
          ),
        ),
      ],
    );
  }
}
