import 'package:flutter/material.dart';

import 'package:magician_ai/common/wand_ui/theme/tokens.dart';

import 'package:mix/mix.dart';

class MessagesBar extends StatefulWidget {
  const MessagesBar({
    super.key,
    required this.messages,
    required this.onTap,
  });

  final List<String> messages;
  final void Function(int) onTap;

  @override
  State<MessagesBar> createState() => _MessagesBarState();
}

class _MessagesBarState extends State<MessagesBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $box.color.ref($wand.color.white(6)),
        $box.borderRadius(20),
        $box.width.infinity(),
        $flex.mainAxisSize.min(),
        $flex.mainAxisAlignment.start(),
        $flex.crossAxisAlignment.start(),
        $flex.wrap.padding.vertical($wand.space.space4()),
        $flex.wrap.padding.horizontal($wand.space.space4()),
        $with.align(alignment: Alignment.topRight),
      ),
      child: StyledFlex(
        direction: Axis.vertical,
        inherit: true,
        children: [
          StyledText(
            'History',
            style: Style(
              $text.style.ref($wand.text.semibold16),
              $text.style.fontSize(18),
              $text.style.color.ref($wand.color.white()),
            ),
          ),
          Box(
            style: Style(
              $box.height(1),
              $box.color.ref($wand.color.white(5)),
              $box.wrap.padding.vertical.ref($wand.space.space3),
            ),
          ),
          for (int i = 0; i < widget.messages.length; i++)
            Pressable(
              child: BarOption(
                text: widget.messages[i],
                isSelected: i == _selectedIndex,
              ),
              onPress: () {
                setState(() {
                  _selectedIndex = i;
                });
                widget.onTap(i);
              },
            ),
        ],
      ),
    );
  }
}

class BarOption extends StatelessWidget {
  const BarOption({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $box.width.infinity(),
        $box.padding.all.ref($wand.space.space1),
        $box.color.transparent(),
        $box.borderRadius.all.ref($wand.radius.radius2),
        $text.style.color.ref($wand.color.white(3)),
        $text.style.ref($wand.text.regular14),
        $text.maxLines(2),
        $text.overflow.ellipsis(),
        $on.hover(
          $box.padding.horizontal.ref($wand.space.space2),
          $box.color.ref($wand.color.white(6)),
          $text.style.color.ref($wand.color.white(2)),
        ),
        isSelected ? $text.style.color.ref($wand.color.white()) : null,
        isSelected ? $box.padding.left.ref($wand.space.space2) : null,
      ).animate(
        duration: Durations.short2,
      ),
      child: StyledText(text),
    );
  }
}
