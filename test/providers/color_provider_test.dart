import 'dart:ui';

import 'package:test/test.dart';
import 'package:hello_flutter_web_application/providers/color_provider.dart';

void main() {
  final colorProvider = RandomColorProvider();

  group('Random color provider returns', () {
    test('non-transparent RGB color', () {
      expect(
          colorProvider.get(),
          const TypeMatcher<Color>()
              .having((e) => e.alpha, 'alpha', equals(255))
              .having((e) => e.blue, 'blue', inInclusiveRange(0, 255))
              .having((e) => e.red, 'red', inInclusiveRange(0, 255))
              .having((e) => e.green, 'green', inInclusiveRange(0, 255)));
    });

    test('random colors in sequence calls', () {
      final colors = [
        colorProvider.get(),
        colorProvider.get(),
        colorProvider.get()
      ];

      expect(
          colors,
          const TypeMatcher<List<Color>>().having(
              (e) => e.toSet().toList().length,
              'has unique elements',
              inInclusiveRange(2, 3)));
    });
  });
}
