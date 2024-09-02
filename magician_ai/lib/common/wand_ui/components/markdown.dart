import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:magician_ai/common/wand_ui/theme/tokens.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

// class CodeBuilder extends MarkdownElementBuilder {
//   final BuildContext context;

//   CodeBuilder({required this.context});

//   @override
//   Widget? visitText(md.Text text, TextStyle? preferredStyle) {
//     print(text.text);
//     final ScrollController preScrollController = ScrollController();
//     return Stack(
//       clipBehavior: Clip.none,
//       key: Key('value'),
//       children: [
//         Align(
//           alignment: Alignment.bottomRight,
//           child: Container(
//             height: 30,
//             width: 100,
//             color: Colors.amber,
//           ),
//         ),
//         Scrollbar(
//           controller: preScrollController,
//           child: SingleChildScrollView(
//             controller: preScrollController,
//             scrollDirection: Axis.horizontal,
//             padding: EdgeInsets.all(12),
//             child: Text.rich(
//               TextSpan(text: text.text),
//               textScaler: TextScaler.linear(1.0),
//               textAlign: TextAlign.start,
//               style: $wand.text.regular16.resolve(context).copyWith(
//                     color: $wand.color.white(2).resolve(context),
//                   ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: Container(
//             height: 30,
//             width: 100,
//             color: Colors.red,
//           ),
//         ),
//       ],
//     );
//   }
// }

class WandMarkdown extends StatelessWidget {
  final String data;

  const WandMarkdown({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MarkdownWidget(
      data: data,
      shrinkWrap: true,
      config: MarkdownConfig.darkConfig.copy(configs: [
        PConfig(
          textStyle: $wand.text.regular16.resolve(context).copyWith(
                color: $wand.color.white(2).resolve(context),
              ),
        ),
        LinkConfig(
          style: TextStyle(color: $wand.color.accent(2).resolve(context)),
        ),
        CodeConfig(
          style: GoogleFonts.firaCode(fontSize: 15),
        ),
        PreConfig(
          theme: atomOneDarkTheme,
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: $wand.color.white(6).resolve(context),
          ),
          styleNotMatched: GoogleFonts.firaCode(fontSize: 14),
          textStyle: GoogleFonts.firaCode(),
          wrapper: (child, code, language) {
            if (language.isEmpty) {
              return SizedBox();
            }
            return CodeContainer(
              code: code,
              language: language,
              child: child,
            );
          },
        ),
      ]),
    );
  }
}

class CodeContainer extends StatelessWidget {
  const CodeContainer({
    super.key,
    required this.child,
    required this.code,
    required this.language,
  });

  final Widget child;
  final String code;
  final String language;

  @override
  Widget build(BuildContext context) {
    return StyledColumn(
      style: Style(
        $with.clipRRect(borderRadius: BorderRadius.circular(10)),
        $box.padding.vertical.ref($wand.space.space2),
        $box.alignment.centerLeft(),
        $box.padding.horizontal.ref($wand.space.space4),
        $box.color.ref($wand.color.white(5)),
      ),
      children: [
        SelectionContainer.disabled(
          child: Box(
            inherit: true,
            child: StyledText(language),
          ),
        ),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            child,
            SelectionContainer.disabled(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                  right: 8.0,
                ),
                child: XButton(
                  iconLeft: LucideIcons.copy,
                  label: '',
                  onPressed: () {
                    print(code);
                  },
                  style: Style(
                    $button.icon.size(16),
                    $button.container.padding.all.ref($wand.space.space2),
                    $button.container.color.ref($wand.color.white(6)),
                    $on.hover(
                      $button.container.color.ref($wand.color.white(5)),
                    ),
                    $button.icon.color.ref($wand.color.white(2)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
