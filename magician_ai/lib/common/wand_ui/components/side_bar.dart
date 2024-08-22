import 'package:flutter/material.dart';

import 'package:magician_ai/common/wand_ui/theme/tokens.dart';
import 'package:mix/mix.dart';

import 'button.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $box.color.ref($wand.color.white(6)),
        $box.width(300),
        $box.borderRadius.all.ref($wand.radius.radius5),
        $box.wrap.padding.all.ref($wand.space.space8),
        $flex.wrap.padding.all.ref($wand.space.space4),
        $on.breakpoint(Breakpoint(maxWidth: 1100))(
          $box.width(100),
        ),
      ).animate(
          duration: Duration(milliseconds: 100), curve: Curves.decelerate),
      child: StyledFlex(
        inherit: true,
        direction: Axis.vertical,
        children: [
          WandButton.primary(
            label: $on.breakpoint(Breakpoint(maxWidth: 1100)).when(context)
                ? 'New'
                : 'Create new chat',
            onPressed: () {},
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Center(
              child: Text('Wand UI'),
            ),
          )
        ],
      ),
    );
  }
}
