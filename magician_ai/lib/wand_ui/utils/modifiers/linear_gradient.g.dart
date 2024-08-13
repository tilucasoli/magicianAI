// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linear_gradient.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$LinearGradientModifierSpec
    on WidgetModifierSpec<LinearGradientModifierSpec> {
  /// Creates a copy of this [LinearGradientModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  LinearGradientModifierSpec copyWith({
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    List<Color>? colors,
    List<double>? stops,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    return LinearGradientModifierSpec(
      begin: begin ?? _$this.begin,
      end: end ?? _$this.end,
      colors: colors ?? _$this.colors,
      stops: stops ?? _$this.stops,
      tileMode: tileMode ?? _$this.tileMode,
      transform: transform ?? _$this.transform,
    );
  }

  /// Linearly interpolates between this [LinearGradientModifierSpec] and another [LinearGradientModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [LinearGradientModifierSpec] is returned. When [t] is 1.0, the [other] [LinearGradientModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [LinearGradientModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [LinearGradientModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [LinearGradientModifierSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [AlignmentGeometry.lerp] for [begin] and [end].

  /// For [colors] and [stops] and [tileMode] and [transform], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [LinearGradientModifierSpec] is used. Otherwise, the value
  /// from the [other] [LinearGradientModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [LinearGradientModifierSpec] configurations.
  @override
  LinearGradientModifierSpec lerp(LinearGradientModifierSpec? other, double t) {
    if (other == null) return _$this;

    return LinearGradientModifierSpec(
      begin: AlignmentGeometry.lerp(_$this.begin, other.begin, t),
      end: AlignmentGeometry.lerp(_$this.end, other.end, t),
      colors: t < 0.5 ? _$this.colors : other.colors,
      stops: t < 0.5 ? _$this.stops : other.stops,
      tileMode: t < 0.5 ? _$this.tileMode : other.tileMode,
      transform: t < 0.5 ? _$this.transform : other.transform,
    );
  }

  /// The list of properties that constitute the state of this [LinearGradientModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [LinearGradientModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.begin,
        _$this.end,
        _$this.colors,
        _$this.stops,
        _$this.tileMode,
        _$this.transform,
      ];

  LinearGradientModifierSpec get _$this => this as LinearGradientModifierSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
        .add(DiagnosticsProperty('begin', _$this.begin, defaultValue: null));
    properties.add(DiagnosticsProperty('end', _$this.end, defaultValue: null));
    properties
        .add(DiagnosticsProperty('colors', _$this.colors, defaultValue: null));
    properties
        .add(DiagnosticsProperty('stops', _$this.stops, defaultValue: null));
    properties.add(
        DiagnosticsProperty('tileMode', _$this.tileMode, defaultValue: null));
    properties.add(
        DiagnosticsProperty('transform', _$this.transform, defaultValue: null));
  }
}

/// Represents the attributes of a [LinearGradientModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [LinearGradientModifierSpec].
///
/// Use this class to configure the attributes of a [LinearGradientModifierSpec] and pass it to
/// the [LinearGradientModifierSpec] constructor.
final class LinearGradientModifierSpecAttribute
    extends WidgetModifierSpecAttribute<LinearGradientModifierSpec>
    with Diagnosticable {
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final List<ColorDto>? colors;
  final List<double>? stops;
  final TileMode? tileMode;
  final GradientTransform? transform;

  const LinearGradientModifierSpecAttribute({
    this.begin,
    this.end,
    this.colors,
    this.stops,
    this.tileMode,
    this.transform,
  });

  /// Resolves to [LinearGradientModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final linearGradientModifierSpec = LinearGradientModifierSpecAttribute(...).resolve(mix);
  /// ```
  @override
  LinearGradientModifierSpec resolve(MixData mix) {
    return LinearGradientModifierSpec(
      begin: begin,
      end: end,
      colors: colors?.map((e) => e.resolve(mix)).toList(),
      stops: stops,
      tileMode: tileMode,
      transform: transform,
    );
  }

  /// Merges the properties of this [LinearGradientModifierSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [LinearGradientModifierSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  LinearGradientModifierSpecAttribute merge(
      LinearGradientModifierSpecAttribute? other) {
    if (other == null) return this;

    return LinearGradientModifierSpecAttribute(
      begin: other.begin ?? begin,
      end: other.end ?? end,
      colors: MixHelpers.mergeList(colors, other.colors),
      stops: MixHelpers.mergeList(stops, other.stops),
      tileMode: other.tileMode ?? tileMode,
      transform: other.transform ?? transform,
    );
  }

  /// The list of properties that constitute the state of this [LinearGradientModifierSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [LinearGradientModifierSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        begin,
        end,
        colors,
        stops,
        tileMode,
        transform,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('begin', begin, defaultValue: null));
    properties.add(DiagnosticsProperty('end', end, defaultValue: null));
    properties.add(DiagnosticsProperty('colors', colors, defaultValue: null));
    properties.add(DiagnosticsProperty('stops', stops, defaultValue: null));
    properties
        .add(DiagnosticsProperty('tileMode', tileMode, defaultValue: null));
    properties
        .add(DiagnosticsProperty('transform', transform, defaultValue: null));
  }
}

/// Utility class for configuring [LinearGradientModifierSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [LinearGradientModifierSpecAttribute].
/// Use the methods of this class to configure specific properties of a [LinearGradientModifierSpecAttribute].
class LinearGradientModifierSpecUtility<T extends Attribute>
    extends SpecUtility<T, LinearGradientModifierSpecAttribute> {
  /// Utility for defining [LinearGradientModifierSpecAttribute.begin]
  late final begin = AlignmentGeometryUtility((v) => only(begin: v));

  /// Utility for defining [LinearGradientModifierSpecAttribute.end]
  late final end = AlignmentGeometryUtility((v) => only(end: v));

  /// Utility for defining [LinearGradientModifierSpecAttribute.colors]
  late final colors = ColorListUtility((v) => only(colors: v));

  /// Utility for defining [LinearGradientModifierSpecAttribute.stops]
  late final stops = ListUtility<T, double>((v) => only(stops: v));

  /// Utility for defining [LinearGradientModifierSpecAttribute.tileMode]
  late final tileMode = TileModeUtility((v) => only(tileMode: v));

  /// Utility for defining [LinearGradientModifierSpecAttribute.transform]
  late final transform = GradientTransformUtility((v) => only(transform: v));

  LinearGradientModifierSpecUtility(super.builder);

  static final self = LinearGradientModifierSpecUtility((v) => v);

  /// Returns a new [LinearGradientModifierSpecAttribute] with the specified properties.
  @override
  T only({
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    List<ColorDto>? colors,
    List<double>? stops,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    return builder(LinearGradientModifierSpecAttribute(
      begin: begin,
      end: end,
      colors: colors,
      stops: stops,
      tileMode: tileMode,
      transform: transform,
    ));
  }
}

/// A tween that interpolates between two [LinearGradientModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [LinearGradientModifierSpec] specifications.
class LinearGradientModifierSpecTween
    extends Tween<LinearGradientModifierSpec?> {
  LinearGradientModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  LinearGradientModifierSpec lerp(double t) {
    if (begin == null && end == null) {
      return const LinearGradientModifierSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
