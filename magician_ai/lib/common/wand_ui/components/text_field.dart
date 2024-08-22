import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:magician_ai/common/wand_ui/components/button.dart';
import 'package:magician_ai/common/wand_ui/theme/tokens.dart';
import 'package:magician_ai/common/wand_ui/utils/extensions/modifiers.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

typedef TextFieldCallback = void Function(String value);

class WardTextField extends StatefulWidget {
  const WardTextField({super.key, required this.onSubmit});

  final TextFieldCallback onSubmit;

  @override
  State<WardTextField> createState() => _WardTextFieldState();
}

class _WardTextFieldState extends State<WardTextField> {
  late final FocusNode _focus;
  late final TextEditingController _controller;
  late final MixWidgetStateController _pressableController;

  void _onSubmit(String value) {
    widget.onSubmit(value);
    _controller.clear();
  }

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _controller = TextEditingController();
    _pressableController = MixWidgetStateController();

    _focus.addListener(_onFocusChange);
    _controller.addListener(_onTextChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _controller.removeListener(_onFocusChange);
    _focus.dispose();
    _controller.dispose();
    _pressableController.dispose();
  }

  void _onFocusChange() {
    _pressableController.focused = _focus.hasFocus;
  }

  void _onTextChange() {
    _pressableController.focused = _controller.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final card = CardSpecUtility.self;

    return ClipRRect(
      borderRadius:
          BorderRadius.vertical(top: $wand.radius.radius4.resolve(context)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
        child: RxBlankCard(
          style: Style(
            card.container.borderRadius.top.ref($wand.radius.radius4),
            card.container.color.ref($wand.color.white(6)),
            card.container.padding.all.ref($wand.space.space2),
            card.container.padding.horizontal.ref($wand.space.space3),
            card.container.border.all.color.ref($wand.color.white(5)),
            card.container.border.bottom.style.none(),
            card.flex.crossAxisAlignment.center(),
            card.flex.mainAxisAlignment.start(),
            card.flex.gap(16),
            card.flex.row(),
          ),
          children: [
            Pressable(
              controller: _pressableController,
              child: StyledIcon(
                LucideIcons.sparkles,
                style: Style(
                  $with.linearGradient.colors([
                    Color(0xFF8372F7),
                    Color(0xFFC080FF),
                  ]),
                  $icon.color.ref($wand.color.white(2)),
                  $icon.shadow.color.ref($wand.color.white(6)),
                  $icon.shadow.blurRadius(0),
                  $with.transform.scale(0.90),
                  $with.padding.left.ref($wand.space.space1),
                  $on.focus(
                    $with.transform.scale(1.1),
                    $icon.color.ref($wand.color.white()),
                    $icon.shadow.color.ref($wand.color.white(1)),
                    $icon.shadow.blurRadius(1),
                  ),
                ).animate(
                  // curve: Curves.decelerate,
                  duration: Duration(milliseconds: 100),
                ),
              ),
            ),
            Flexible(
              child: TextField(
                textInputAction: TextInputAction.done,
                onSubmitted: _onSubmit,
                focusNode: _focus,
                controller: _controller,
                minLines: null,
                maxLines: null,
                style: $wand.text.regular16.resolve(context).copyWith(
                      color: $wand.color.white(2).resolve(context),
                    ),
                decoration: InputDecoration(
                  hintText: 'Try "List three benefits of using AI"',
                  hintStyle: TextStyle(
                    color: $wand.color.white(4).resolve(context),
                  ),
                  labelStyle: TextStyle(
                    color: $wand.color.white(2).resolve(context),
                  ),
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            WandButton.icon(
              icon: LucideIcons.arrowRight,
              onPressed: () {
                _onSubmit(_controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
