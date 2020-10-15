import 'dart:math';

import 'dart:ui';

abstract class ColorProvider {
  Color get();
}

class RandomColorProvider implements ColorProvider {
  @override
  Color get() {
    final randomRgbInt = Random().nextInt(0xFFFFFF);
    return Color(randomRgbInt).withOpacity(1);
  }
}
