import 'package:flutter/widgets.dart';
import 'package:hello_flutter_web_application/providers/color_provider.dart';
import 'package:hello_flutter_web_application/widgets/application_root_widget.dart';

/// Entry point of the application to initiate application dependency and start it.
void main() {
  final randomColorProvider = RandomColorProvider.uniform();
  runApp(ApplicationRootWidget(randomColorProvider));
}
