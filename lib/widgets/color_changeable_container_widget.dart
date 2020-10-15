import 'package:flutter/material.dart';
import 'package:hello_flutter_web_application/providers/color_provider.dart';

class ColorChangeableContainerWidget extends StatefulWidget {
  ColorChangeableContainerWidget(
      {Key key,
      @required this.child,
      @required this.colorProvider,
      this.defaultPageBackgroundColor = Colors.black})
      : super(key: key);

  final Widget child;
  final ColorProvider colorProvider;
  final Color defaultPageBackgroundColor;

  @override
  State<StatefulWidget> createState() {
    return _ColorChangeableContainerWidgetState();
  }
}

class _ColorChangeableContainerWidgetState
    extends State<ColorChangeableContainerWidget> {
  Color _pageBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _changePageBackgroundColorRandomly();
        },
        child: Container(color: _pageBackgroundColor, child: widget.child));
  }

  void _changePageBackgroundColorRandomly() {
    setState(() {
      _pageBackgroundColor = widget.colorProvider.get();
    });
  }

  @override
  void initState() {
    _pageBackgroundColor = widget.defaultPageBackgroundColor;
    super.initState();
  }
}
