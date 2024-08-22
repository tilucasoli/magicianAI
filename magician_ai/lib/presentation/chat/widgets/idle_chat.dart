import 'package:flutter/material.dart';
import 'package:magician_ai/common/wand_ui/components/card.dart';
import 'package:magician_ai/common/wand_ui/theme/tokens.dart';
import 'package:magician_ai/common/wand_ui/utils/extensions/modifiers.dart';
import 'package:mix/mix.dart';

import '../../../common/wand_ui/components/button.dart';

class IdleChatController {
  final void Function(String) handleTapOnTag;
  final tags = [
    'What is LLM?',
    'Does LobeChat support image recognition and generation?',
    'Does LobeChat support multiple AI service providers?',
  ];

  IdleChatController({required this.handleTapOnTag});
}

class IdleChat extends StatelessWidget {
  const IdleChat({
    super.key,
    required this.controller,
  });

  final IdleChatController controller;

  @override
  Widget build(BuildContext context) {
    return StyledFlex(
      style: Style(
        $flex.crossAxisAlignment.start(),
        $flex.mainAxisAlignment.start(),
        $flex.mainAxisSize.min(),
        $with.padding.horizontal.ref($wand.space.space10),
      ),
      direction: Axis.vertical,
      children: [
        StyledText(
          'Let\'s Code!',
          style: Style(
            $text.style.color.ref($wand.color.white(2)),
            $text.style.ref($wand.text.black64),
            $with.linearGradient.begin.topLeft(),
            $with.linearGradient.end.bottomCenter(),
            $with.padding.bottom.ref($wand.space.space2),
            $with.linearGradient.colors([
              $wand.color.accent(2).resolve(context),
              $wand.color.accent().resolve(context),
            ]),
          ),
        ),
        StyledText(
          'Hello, how can I help you?',
          style: Style(
            $text.style.color.ref($wand.color.white(2)),
            $text.style.ref($wand.text.regular24),
            $with.padding.bottom.ref($wand.space.space8),
          ),
        ),
        StyledText(
          'Assistants Recommendations:',
          style: Style(
            $text.style.color.ref($wand.color.white(3)),
            $text.style.ref($wand.text.regular16),
            $with.padding.bottom.ref($wand.space.space4),
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: $wand.space.space4().resolve(context),
          mainAxisSpacing: $wand.space.space4().resolve(context),
          shrinkWrap: true,
          childAspectRatio: 2.5,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(
            4,
            (index) {
              return WandCard(
                children: [
                  StyledText(
                    'Assistant $index',
                    style: Style(
                      $text.style.color.ref($wand.color.white()),
                      $text.style.ref($wand.text.semibold14),
                      $with.padding.bottom.ref($wand.space.space1),
                    ),
                  ),
                  StyledText(
                    'You are an efficient AI programming assistant, skilled in writing and fixing code',
                    style: Style(
                      $text.style.color.ref($wand.color.white()),
                      $text.style.ref($wand.text.regular14),
                      $text.style.color.ref($wand.color.white(2)),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        StyledText(
          'Frequently Asked Questions:',
          style: Style(
            $text.style.color.ref($wand.color.white(3)),
            $text.style.ref($wand.text.regular16),
            $with.padding.top.ref($wand.space.space6),
            $with.padding.bottom.ref($wand.space.space4),
          ),
        ),
        Wrap(
          spacing: $wand.space.space2().resolve(context),
          runSpacing: $wand.space.space3().resolve(context),
          children: List.generate(controller.tags.length, (i) {
            return WandButton.tag(
              label: controller.tags[i],
              onPressed: () => controller.handleTapOnTag(controller.tags[i]),
            );
          }),
        )
      ],
    );
  }
}
