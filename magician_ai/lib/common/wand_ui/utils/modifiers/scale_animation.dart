import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

// part 'scale_animation.g.dart';

// @MixableSpec()
// final class ScaleAnimationModifierSpec
//     extends WidgetModifierSpec<ScaleAnimationModifierSpec>
//     with _$ScaleAnimationModifierSpec, Diagnosticable {
//   final Duration? duration;
//   final double? scale;
//   final Curve? curve;
//   final bool? repeat;

//   const ScaleAnimationModifierSpec({
//     this.duration,
//     this.scale,
//     this.curve,
//     this.repeat,
//   });

//   @override
//   Widget build(Widget child) {
//     return ScaleAnimation(
//       child: child,
//       duration: duration ?? const Duration(milliseconds: 300),
//       scale: scale ?? 2.0,
//       curve: curve ?? Curves.bounceIn,

//     );
//   }
// }

class ScaleAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scale;
  final Curve curve;
  final bool repeat;

  const ScaleAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.scale = 1.0,
    this.curve = Curves.bounceIn,
    this.repeat = false,
  }) : super(key: key);

  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _curved;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    if (widget.repeat) {
      _controller.repeat(reverse: true);
    } else {
      _controller.forward();
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
    }

    _curved = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        print(_controller);
        return Transform.scale(
          scale: lerpDouble(1, widget.scale, _curved.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
