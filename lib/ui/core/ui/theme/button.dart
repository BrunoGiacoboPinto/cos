import 'package:flutter/material.dart';

import 'colors.dart';
import 'spacing.dart';

final primaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: primaryBlue,
  foregroundColor: pureWhite,
  padding: const EdgeInsets.symmetric(
    horizontal: buttonPaddingHorizontal,
    vertical: buttonPaddingVertical,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6.0),
  ),
  textStyle: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  ),
  elevation: 0,
);

final secondaryButtonStyle = OutlinedButton.styleFrom(
  backgroundColor: Colors.transparent,
  foregroundColor: primaryBlue,
  side: const BorderSide(color: primaryBlue, width: 2.0),
  padding: const EdgeInsets.symmetric(
    horizontal: 22.0,
    vertical: 10.0,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6.0),
  ),
  textStyle: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  ),
);

final ctaButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: orange,
  foregroundColor: pureWhite,
  padding: const EdgeInsets.symmetric(
    horizontal: 32.0,
    vertical: 16.0,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6.0),
  ),
  textStyle: const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
  ),
  elevation: 0,
);

final class LimitedRadiusSplashFactory extends InteractiveInkFeatureFactory {
  const LimitedRadiusSplashFactory({this.radius = 36.0});

  final double radius;

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    return InkRipple(
      controller: controller,
      referenceBox: referenceBox,
      position: position,
      color: color,
      containedInkWell: containedInkWell,
      rectCallback: rectCallback,
      borderRadius: borderRadius,
      customBorder: customBorder,
      radius: this.radius, // Use our custom radius
      onRemoved: onRemoved,
      textDirection: textDirection,
    );
  }
}
