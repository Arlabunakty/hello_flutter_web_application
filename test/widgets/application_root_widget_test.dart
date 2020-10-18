import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_flutter_web_application/providers/color_provider.dart';
import 'package:hello_flutter_web_application/widgets/application_root_widget.dart';
import 'package:hello_flutter_web_application/widgets/main_page_widget.dart';

void main() {
  final randomColorProvider = RandomColorProvider.uniform();

  testWidgets(
      'Application root widget shows Main page with the given color provider',
      (WidgetTester tester) async {
    final mainPageWidgetFinder = find.byWidgetPredicate((Widget widget) =>
        widget is MainPageWidget &&
        widget.colorProvider == randomColorProvider);

    await tester.pumpWidget(ApplicationRootWidget(randomColorProvider));

    expect(mainPageWidgetFinder, findsOneWidget);
  });
}
