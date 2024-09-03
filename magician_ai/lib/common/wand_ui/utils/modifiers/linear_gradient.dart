import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'linear_gradient_spec.dart';

@MixableSpec()
final class LinearGradientModifierSpec
    extends WidgetModifierSpec<LinearGradientModifierSpec>
    with _$LinearGradientModifierSpec, Diagnosticable {
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final List<Color>? colors;
  final List<double>? stops;
  final TileMode? tileMode;
  final GradientTransform? transform;

  const LinearGradientModifierSpec({
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.colors = const [],
    this.stops,
    this.tileMode = TileMode.clamp,
    this.transform,
  });

  @override
  Widget build(Widget child) {
    return ShaderMask(
      shaderCallback: (Rect bounds) => LinearGradient(
        begin: begin ?? Alignment.centerLeft,
        end: end ?? Alignment.centerRight,
        colors: colors ?? const [],
        stops: stops,
        tileMode: tileMode ?? TileMode.clamp,
        transform: transform,
      ).createShader(bounds),
      child: child,
    );
  }
}
