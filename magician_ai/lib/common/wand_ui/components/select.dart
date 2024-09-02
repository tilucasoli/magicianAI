import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:magician_ai/common/wand_ui/components/text_field.dart';
import 'package:magician_ai/common/wand_ui/utils/extensions/modifiers.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../theme/tokens.dart';

class SelectController {
  final void Function(String) onChanged;
  final List<XSelectMenuItem<String>> items;
  final String? value;

  final bool enabled;

  SelectController({
    required this.onChanged,
    required this.items,
    this.value,
    this.enabled = true,
  });
}

class WandSelect extends StatelessWidget {
  const WandSelect({
    super.key,
    required this.controller,
  });

  final SelectController controller;

  @override
  Widget build(BuildContext context) {
    return XSelect<String>(
      value: controller.value ?? '',
      items: controller.items,
      onChanged: controller.onChanged,
      // enabled: controller.enabled,
      style: style2(context).animate(duration: Durations.medium4),
      button: (SelectButtonSpec spec) {
        return spec.container(
          child: spec.flex(
            direction: Axis.horizontal,
            children: [
              spec.icon(
                LucideIcons.sparkles,
              ),
              spec.label(controller.value ?? 'Select a Model'),
            ],
          ),
        );
      },
    );
  }
}

Style style2(BuildContext context) => Style(
      $select.position.targetAnchor.topCenter(),
      $select.position.followerAnchor.bottomCenter(),
      $select.menu.container.padding.all(8),
      $select.menu.container.wrap.padding.bottom(0),
      $on.selected(
        $select.menu.container.wrap.padding.bottom(10),
      ),
      $select.menu.container.color(Color(0xFF202020)),
      $select.item.text.style.color.ref($wand.color.white()),
      $select.button.icon.wrap.linearGradient.colors([
        $wand.color.accent(2).resolve(context),
        $wand.color.accent().resolve(context),
      ]),
      $select.button.container.gradient.linear.colors([
        $wand.color.accent(2).resolve(context),
        $wand.color.accent().resolve(context),
      ]),
      $select.button.container.gradient.linear.begin.topLeft(),
      $select.button.container.gradient.linear.end.bottomCenter(),
      $select.button.container.color.ref($wand.color.white(4)),
      $select.button.container.borderRadius.all.ref($wand.radius.radius5),
      $select.button.icon.color.ref($wand.color.white(2)),
      // $select.button.icon.shadow.color.ref($wand.color.white(6)),
      // $select.button.icon.shadow.blurRadius(0),
      $select.button.flex.gap(8),
      $select.button.container.wrap.transform.scale(1),
      // $select.button.container.color.ref($wand.color.accent()),
      // $select.button.container.color.withOpacity(0.0),
      $on.hover(
        $select.item.container.color.ref($wand.color.accent()),
        $select.item.container.color.withOpacity(0.7),
        $select.button.container.shadow(
          color: $wand.color.accent().resolve(context),
          blurRadius: 10,
          offset: Offset.zero,
        ),
        $select.button.icon.shadow(
          color: $wand.color.white(3).resolve(context),
          blurRadius: 5,
        ),
        $select.button.container.color.ref($wand.color.white()),
        $select.button.container.wrap.transform.scale(1.05),
        $select.button.icon.wrap.linearGradient.colors([
          $wand.color.white().resolve(context),
          $wand.color.white().resolve(context),
        ]),
      ),
      $select.button.label.style.color.ref($wand.color.white(2)),
      $select.button.label.style.ref($wand.text.regular14),
    );
    
// style: Style(
            
            // $box.gradient.linear.colors([
            //   $wand.color.accent(2).resolve(context),
            //   $wand.color.accent().resolve(context),
            // ]),
            
            
//             $flex.wrap.padding.horizontal.ref($wand.space.space3),
//             $flex.wrap.padding.vertical.ref($wand.space.space2),




            // $box.shadow.color.ref($wand.color.accent()),
            // $box.shadow.color.withOpacity(0.0),
//             $on.hover(
//               $flex.gap(8),
//               $box.shadow.color.withOpacity(1),
//               $box.shadow.color.ref($wand.color.accent()),
//               $box.shadow.offset.zero(),
//               $box.shadow.blurRadius(10),
//               $box.color.ref($wand.color.white()),
//               $icon.shadow.color.ref($wand.color.white(3)),
//               $icon.shadow.blurRadius(5),
//               $with.transform.scale(1.05),
//               $icon.wrap.linearGradient.colors([
//                 $wand.color.white().resolve(context),
//                 $wand.color.white().resolve(context),
//               ]),
//             ),
//             $on.disabled(
//               $text.wrap.visibility.off(),
//               $flex.gap(0),
//               $box.gradient.linear.colors([
//                 $wand.color.white(4).resolve(context),
//                 $wand.color.white(4).resolve(context),
//               ]),
//               $box.color.ref($wand.color.white(4)),
//             ),
//             $text.style.color.ref($wand.color.white(2)),
//             $text.style.ref($wand.text.regular14),
//           ).animate(
//               curve: Curves.decelerate, duration: Duration(milliseconds: 150)),