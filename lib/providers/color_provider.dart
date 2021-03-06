import 'dart:math';

import 'dart:ui';

import 'package:flutter/material.dart';

/// Provides coloring for the application.
abstract class ColorProvider {
  /// Returns the color to draw output associated
  /// with the given implementation details.
  Color get();
}

/// Provides random color on each call.
///
/// It's based on pseudo random number generator. Returned color is not-transparent.
class RandomColorProvider implements ColorProvider {
  /// The alpha layer value to represent the fully opaque color.
  static const _solidColorOpacity = 1.0;

  /// The RGB max exclusive boundary for color interval generation.
  static const _maxExclusiveOfRgbInterval = 0x1000000;

  /// Creates [RandomColorProvider], which returns random color based on the given [Random] distribution.
  RandomColorProvider(this._random);

  /// Creates [RandomColorProvider], which returns random color based on uniform distribution.
  RandomColorProvider.uniform() : _random = Random();

  /// A random number generator.
  final Random _random;

  @override
  Color get() {
    final randomRgbInt = _random.nextInt(_maxExclusiveOfRgbInterval);
    return Color(randomRgbInt).withOpacity(_solidColorOpacity);
  }
}
