import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../common/wand_ui/components/main_text_field.dart';
import '../../common/wand_ui/theme/tokens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StyledText(
          'RemixGen',
          style: Style(
            $text.style.ref($wand.text.semibold64),
            $text.style.color.ref($wand.color.black),
            $text.style.fontWeight(FontWeight.w800),
          ),
        ),
        StyledText(
          'Forging Tomorrow\'s UI',
          style: Style(
            $text.style.ref($wand.text.regular24),
            $text.style.fontWeight.bold(),
            $text.style.color.ref($wand.color.black),
          ),
        ),
        SizedBox(height: 60),
        MainInput(),
      ],
    );
  }
}
