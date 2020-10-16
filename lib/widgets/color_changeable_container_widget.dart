import 'package:flutter/material.dart';
import 'package:hello_flutter_web_application/providers/color_provider.dart';

/// A widget representing a colored container. The color changes on tap action,
/// except situation when child overrides tap callback
class ColorChangeableContainerWidget extends StatefulWidget {
  /// Creates an [ColorChangeableContainerWidget] with the given default background color.
  ColorChangeableContainerWidget(
      {Key key,
      @required this.child,
      @required this.colorProvider,
      this.defaultBackgroundColor = Colors.black})
      : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// [ColorChangeableContainerWidget] uses `colorProvider` to pick a color
  /// for drawing container background.
  final ColorProvider colorProvider;

  /// The initial container background color.
  final Color defaultBackgroundColor;

  @override
  State<StatefulWidget> createState() {
    return _ColorChangeableContainerWidgetState();
  }
}

class _ColorChangeableContainerWidgetState
    extends State<ColorChangeableContainerWidget> {
  /// The modifiable color to represent current container background color.
  Color _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _updateBackgroundColor(),
        child: Container(color: _backgroundColor, child: widget.child));
  }

  void _updateBackgroundColor() {
    setState(() => _backgroundColor = widget.colorProvider.get());
  }

  /// Sets current background color from widget property.
  @override
  void initState() {
    _backgroundColor = widget.defaultBackgroundColor;
    super.initState();
  }
}
