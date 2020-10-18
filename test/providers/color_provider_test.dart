import 'dart:math';
import 'dart:ui';

import 'package:test/test.dart';
import 'package:hello_flutter_web_application/providers/color_provider.dart';
import 'package:mockito/mockito.dart';

void main() {
  Random mockRandom;
  ColorProvider colorProvider;

  setUp(() {
    mockRandom = MockRandom();
    colorProvider = colorProvider = RandomColorProvider(mockRandom);
  });

  test(
      'Random color provider returns color based on provided by Random int value',
      () {
    when(mockRandom.nextInt(0x1000000)).thenReturn(0xFFFFFF);

    expect(
        colorProvider.get(),
        const TypeMatcher<Color>()
            .having((e) => e.alpha, 'alpha', equals(255))
            .having((e) => e.blue, 'blue', inInclusiveRange(0, 255))
            .having((e) => e.red, 'red', inInclusiveRange(0, 255))
            .having((e) => e.green, 'green', inInclusiveRange(0, 255)));
  });
}

class MockRandom extends Mock implements Random {}
