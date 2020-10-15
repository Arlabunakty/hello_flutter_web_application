import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter_web_application/providers/color_provider.dart';

import 'main_page_widget.dart';

class ApplicationRootWidget extends StatelessWidget {
  ApplicationRootWidget(this._colorProvider, {Key key}) : super(key: key);

  final ColorProvider _colorProvider;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter Web Application',
      home: MainPageWidget(_colorProvider),
    );
  }
}
