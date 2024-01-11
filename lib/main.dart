import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'core/presentation/theme/light_theme.dart';
import 'injection_container.dart';
import 'src/home/presentation/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(DevicePreview(
      builder: (context) => MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Mediboard',
          home: const HomePage(),
          theme: lightTheme)));
}
