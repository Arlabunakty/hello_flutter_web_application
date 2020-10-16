import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter_web_application/providers/color_provider.dart';

import 'main_page_widget.dart';

class ApplicationRootWidget extends StatelessWidget {
  /// Creates a root level application widget.
  ///
  /// A `colorProvider` is [MainPageWidget] dependency.
  ApplicationRootWidget(this._colorProvider, {Key key}) : super(key: key);

  /// [MainPageWidget] uses `colorProvider` to pick a color for drawing.
  final ColorProvider _colorProvider;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter Web Application',
      home: MainPageWidget(_colorProvider),
    );
  }
}
