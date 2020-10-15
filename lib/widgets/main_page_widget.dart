import 'package:flutter/material.dart';
import 'package:hello_flutter_web_application/providers/color_provider.dart';

import 'color_changeable_container_widget.dart';

class MainPageWidget extends StatelessWidget {
  MainPageWidget(this.colorProvider, {Key key}) : super(key: key);

  final ColorProvider colorProvider;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ColorChangeableContainerWidget(
            child: Center(
                child:
                    Text('Hey there', style: TextStyle(color: Colors.white))),
            colorProvider: colorProvider,
            defaultPageBackgroundColor: Colors.black));
  }
}
