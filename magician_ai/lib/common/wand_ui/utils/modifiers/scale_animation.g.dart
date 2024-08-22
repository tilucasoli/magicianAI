// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'scale_animation.dart';

// // **************************************************************************
// // MixableSpecGenerator
// // **************************************************************************

// mixin _$ScaleAnimation on Spec<ScaleAnimation> {
//   static ScaleAnimation from(MixData mix) {
//     return mix.attributeOf<ScaleAnimationAttribute>()?.resolve(mix) ??
//         const ScaleAnimation();
//   }

//   /// {@template scale_animation_of}
//   /// Retrieves the [ScaleAnimation] from the nearest [Mix] ancestor in the widget tree.
//   ///
//   /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
//   /// given [BuildContext], and then retrieves the [ScaleAnimation] from that [Mix].
//   /// If no ancestor [Mix] is found, this method returns an empty [ScaleAnimation].
//   ///
//   /// Example:
//   ///
//   /// ```dart
//   /// final scaleAnimation = ScaleAnimation.of(context);
//   /// ```
//   /// {@endtemplate}
//   static ScaleAnimation of(BuildContext context) {
//     return _$ScaleAnimation.from(Mix.of(context));
//   }

//   /// Creates a copy of this [ScaleAnimation] but with the given fields
//   /// replaced with the new values.
//   @override
//   ScaleAnimation copyWith({
//     Key? key,
//     Widget? child,
//     Duration? duration,
//     double? scale,
//     Curve? curve,
//     bool? repeat,
//   }) {
//     return ScaleAnimation(
//       key: key ?? _$this.key,
//       child: child ?? _$this.child,
//       duration: duration ?? _$this.duration,
//       scale: scale ?? _$this.scale,
//       curve: curve ?? _$this.curve,
//       repeat: repeat ?? _$this.repeat,
//     );
//   }

//   /// Linearly interpolates between this [ScaleAnimation] and another [ScaleAnimation] based on the given parameter [t].
//   ///
//   /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
//   /// When [t] is 0.0, the current [ScaleAnimation] is returned. When [t] is 1.0, the [other] [ScaleAnimation] is returned.
//   /// For values of [t] between 0.0 and 1.0, an interpolated [ScaleAnimation] is returned.
//   ///
//   /// If [other] is null, this method returns the current [ScaleAnimation] instance.
//   ///
//   /// The interpolation is performed on each property of the [ScaleAnimation] using the appropriate
//   /// interpolation method:
//   ///
//   /// - [MixHelpers.lerpDouble] for [scale].

//   /// For [key] and [child] and [duration] and [curve] and [repeat], the interpolation is performed using a step function.
//   /// If [t] is less than 0.5, the value from the current [ScaleAnimation] is used. Otherwise, the value
//   /// from the [other] [ScaleAnimation] is used.
//   ///
//   /// This method is typically used in animations to smoothly transition between
//   /// different [ScaleAnimation] configurations.
//   @override
//   ScaleAnimation lerp(ScaleAnimation? other, double t) {
//     if (other == null) return _$this;

//     return ScaleAnimation(
//       key: t < 0.5 ? _$this.key : other.key,
//       child: t < 0.5 ? _$this.child : other.child,
//       duration: t < 0.5 ? _$this.duration : other.duration,
//       scale: MixHelpers.lerpDouble(_$this.scale, other.scale, t)!,
//       curve: t < 0.5 ? _$this.curve : other.curve,
//       repeat: t < 0.5 ? _$this.repeat : other.repeat,
//     );
//   }

//   /// The list of properties that constitute the state of this [ScaleAnimation].
//   ///
//   /// This property is used by the [==] operator and the [hashCode] getter to
//   /// compare two [ScaleAnimation] instances for equality.
//   @override
//   List<Object?> get props => [
//         _$this.key,
//         _$this.child,
//         _$this.duration,
//         _$this.scale,
//         _$this.curve,
//         _$this.repeat,
//       ];

//   ScaleAnimation get _$this => this as ScaleAnimation;

//   void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     properties.add(DiagnosticsProperty('key', _$this.key, defaultValue: null));
//     properties
//         .add(DiagnosticsProperty('child', _$this.child, defaultValue: null));
//     properties.add(
//         DiagnosticsProperty('duration', _$this.duration, defaultValue: null));
//     properties
//         .add(DiagnosticsProperty('scale', _$this.scale, defaultValue: null));
//     properties
//         .add(DiagnosticsProperty('curve', _$this.curve, defaultValue: null));
//     properties
//         .add(DiagnosticsProperty('repeat', _$this.repeat, defaultValue: null));
//   }
// }

// /// Represents the attributes of a [ScaleAnimation].
// ///
// /// This class encapsulates properties defining the layout and
// /// appearance of a [ScaleAnimation].
// ///
// /// Use this class to configure the attributes of a [ScaleAnimation] and pass it to
// /// the [ScaleAnimation] constructor.
// class ScaleAnimationAttribute extends SpecAttribute<ScaleAnimation>
//     with Diagnosticable {
//   final Key? key;
//   final Widget? child;
//   final Duration? duration;
//   final double? scale;
//   final Curve? curve;
//   final bool? repeat;

//   const ScaleAnimationAttribute({
//     this.key,
//     this.child,
//     this.duration,
//     this.scale,
//     this.curve,
//     this.repeat,
//   });

//   /// Resolves to [ScaleAnimation] using the provided [MixData].
//   ///
//   /// If a property is null in the [MixData], it falls back to the
//   /// default value defined in the `defaultValue` for that property.
//   ///
//   /// ```dart
//   /// final scaleAnimation = ScaleAnimationAttribute(...).resolve(mix);
//   /// ```
//   @override
//   ScaleAnimation resolve(MixData mix) {
//     return ScaleAnimation(
//       key: key,
//       child: child,
//       duration: duration,
//       scale: scale,
//       curve: curve,
//       repeat: repeat,
//     );
//   }

//   /// Merges the properties of this [ScaleAnimationAttribute] with the properties of [other].
//   ///
//   /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
//   /// [ScaleAnimationAttribute] with the properties of [other] taking precedence over
//   /// the corresponding properties of this instance.
//   ///
//   /// Properties from [other] that are null will fall back
//   /// to the values from this instance.
//   @override
//   ScaleAnimationAttribute merge(covariant ScaleAnimationAttribute? other) {
//     if (other == null) return this;

//     return ScaleAnimationAttribute(
//       key: other.key ?? key,
//       child: other.child ?? child,
//       duration: other.duration ?? duration,
//       scale: other.scale ?? scale,
//       curve: other.curve ?? curve,
//       repeat: other.repeat ?? repeat,
//     );
//   }

//   /// The list of properties that constitute the state of this [ScaleAnimationAttribute].
//   ///
//   /// This property is used by the [==] operator and the [hashCode] getter to
//   /// compare two [ScaleAnimationAttribute] instances for equality.
//   @override
//   List<Object?> get props => [
//         key,
//         child,
//         duration,
//         scale,
//         curve,
//         repeat,
//       ];

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty('key', key, defaultValue: null));
//     properties.add(DiagnosticsProperty('child', child, defaultValue: null));
//     properties
//         .add(DiagnosticsProperty('duration', duration, defaultValue: null));
//     properties.add(DiagnosticsProperty('scale', scale, defaultValue: null));
//     properties.add(DiagnosticsProperty('curve', curve, defaultValue: null));
//     properties.add(DiagnosticsProperty('repeat', repeat, defaultValue: null));
//   }
// }

// /// Utility class for configuring [ScaleAnimationAttribute] properties.
// ///
// /// This class provides methods to set individual properties of a [ScaleAnimationAttribute].
// /// Use the methods of this class to configure specific properties of a [ScaleAnimationAttribute].
// class ScaleAnimationUtility<T extends Attribute>
//     extends SpecUtility<T, ScaleAnimationAttribute> {
//   /// Utility for defining [ScaleAnimationAttribute.key]
//   late final key = KeyUtility((v) => only(key: v));

//   /// Utility for defining [ScaleAnimationAttribute.child]
//   late final child = WidgetUtility((v) => only(child: v));

//   /// Utility for defining [ScaleAnimationAttribute.duration]
//   late final duration = DurationUtility((v) => only(duration: v));

//   /// Utility for defining [ScaleAnimationAttribute.scale]
//   late final scale = DoubleUtility((v) => only(scale: v));

//   /// Utility for defining [ScaleAnimationAttribute.curve]
//   late final curve = CurveUtility((v) => only(curve: v));

//   /// Utility for defining [ScaleAnimationAttribute.repeat]
//   late final repeat = BoolUtility((v) => only(repeat: v));

//   ScaleAnimationUtility(super.builder);

//   static final self = ScaleAnimationUtility((v) => v);

//   /// Returns a new [ScaleAnimationAttribute] with the specified properties.
//   @override
//   T only({
//     Key? key,
//     Widget? child,
//     Duration? duration,
//     double? scale,
//     Curve? curve,
//     bool? repeat,
//   }) {
//     return builder(ScaleAnimationAttribute(
//       key: key,
//       child: child,
//       duration: duration,
//       scale: scale,
//       curve: curve,
//       repeat: repeat,
//     ));
//   }
// }

// /// A tween that interpolates between two [ScaleAnimation] instances.
// ///
// /// This class can be used in animations to smoothly transition between
// /// different [ScaleAnimation] specifications.
// class ScaleAnimationTween extends Tween<ScaleAnimation?> {
//   ScaleAnimationTween({
//     super.begin,
//     super.end,
//   });

//   @override
//   ScaleAnimation lerp(double t) {
//     if (begin == null && end == null) {
//       return const ScaleAnimation();
//     }

//     if (begin == null) {
//       return end!;
//     }

//     return begin!.lerp(end!, t);
//   }
// }
