import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mix/mix.dart';

import '../theme/tokens.dart';

class WandDropdown extends StatelessWidget {
  const WandDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $box.height(40),
        $box.color.ref($wand.color.white(6)),
        $box.borderRadius.all.ref($wand.radius.radius2),
      ),
      child: DropdownButton<String>(
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        icon: StyledIcon(
          LucideIcons.chevronDown,
          style: Style($icon.size(16)),
        ),
        value: 'llama3',
        isDense: true,
        underline: Container(),
        padding: EdgeInsets.all(8),
        items: [
          DropdownMenuItem(
            child: StyledText(
              'text',
              style: Style(
                $with.padding.right(8),
                $text.style.ref($wand.text.semibold16),
                $text.style.color.ref($wand.color.white(2)),
              ),
            ),
            value: "llama3",
          ),
        ],
        onChanged: (a) {},
      ),
    );
  }
}
