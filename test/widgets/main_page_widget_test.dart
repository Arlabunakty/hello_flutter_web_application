import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_flutter_web_application/providers/color_provider.dart';
import 'package:hello_flutter_web_application/widgets/color_changeable_container_widget.dart';
import 'package:hello_flutter_web_application/widgets/main_page_widget.dart';

void main() {
  final randomColorProvider = RandomColorProvider();

  Future _initWidgets(WidgetTester tester) async {
    await tester
        .pumpWidget(MaterialApp(home: MainPageWidget(randomColorProvider)));
  }

  group('MainPageWidget has', () {
    testWidgets('colored container with black color', (tester) async {
      final colorChangeableContainerWidgetFinder = find.byWidgetPredicate(
          (Widget widget) =>
              widget is ColorChangeableContainerWidget &&
              widget.colorProvider == randomColorProvider &&
              widget.defaultPageBackgroundColor.value == Colors.black.value);

      await _initWidgets(tester);

      expect(colorChangeableContainerWidgetFinder, findsOneWidget);
    });

    testWidgets("centered greeting text 'Hey there'", (tester) async {
      await _initWidgets(tester);

      expect(find.widgetWithText(Center, 'Hey there'), findsOneWidget);
    });
  });
}
