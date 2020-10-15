import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ContainerByColorMatchFinder extends MatchFinder {
  final Color color;

  ContainerByColorMatchFinder(this.color, {bool skipOffstage = true})
      : super(skipOffstage: skipOffstage);

  @override
  String get description => 'Container{color: "$color"}';

  @override
  bool matches(Element candidate) {
    if (candidate.widget is Container) {
      final containerWidget = candidate.widget as Container;
      if (containerWidget.color.value == color.value) {
        return true;
      }
    }
    return false;
  }
}
