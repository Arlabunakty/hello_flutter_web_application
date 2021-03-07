import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:hello_flutter_web_application/providers/color_provider.dart';
import 'package:hello_flutter_web_application/widgets/color_changeable_container_widget.dart';

import '../finders/container_by_color_finder.dart';

void main() {
  final coloredContainerFinder = find.byType(Container);
  final childValueKey = ValueKey('child_key');
  final childWidgetFinder = find.byKey(childValueKey);
  ColorProvider mockedColorProvider;
  MaterialApp materialApp;

  setUp(() {
    mockedColorProvider = MockColorProvider();
    materialApp = MaterialApp(
        home: ColorChangeableContainerWidget(
            colorProvider: mockedColorProvider,
            defaultBackgroundColor: Colors.blue,
            child: Text('test_text', key: childValueKey)));
  });

  group('ColorChangeableContainerWidget', () {
    testWidgets('has default color and its child', (tester) async {
      await tester.pumpWidget(materialApp);

      expect(ContainerByColorMatchFinder(Colors.blue), findsOneWidget);
      expect(childWidgetFinder, findsOneWidget);
      verifyZeroInteractions(mockedColorProvider);
    });

    testWidgets('change color on tap', (tester) async {
      await tester.pumpWidget(materialApp);
      when(mockedColorProvider.get()).thenReturn(Colors.brown);

      await tester.tap(coloredContainerFinder);
      await tester.pump();

      expect(ContainerByColorMatchFinder(Colors.brown), findsOneWidget);
      verify(mockedColorProvider.get());
    });

    testWidgets('change color when child is tapped', (tester) async {
      when(mockedColorProvider.get()).thenReturn(Colors.yellow);
      await tester.pumpWidget(materialApp);

      await tester.tap(childWidgetFinder);
      await tester.pump();

      expect(ContainerByColorMatchFinder(Colors.yellow), findsOneWidget);
      verify(mockedColorProvider.get());
    });
  });
}

class MockColorProvider extends Mock implements ColorProvider {}
