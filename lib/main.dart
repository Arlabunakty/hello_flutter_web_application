import 'package:flutter/widgets.dart';
import 'package:hello_flutter_web_application/providers/color_provider.dart';
import 'package:hello_flutter_web_application/widgets/application_root_widget.dart';

void main() {
  final randomColorProvider = RandomColorProvider();
  runApp(ApplicationRootWidget(randomColorProvider));
}
