import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/core/core.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tractian Tree View Challenge',
      theme: lightTheme,
      getPages: Routes.getRoutes(),
      initialRoute: Routes.initialRoute,
    );
  }
}
