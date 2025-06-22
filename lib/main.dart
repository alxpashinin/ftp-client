import 'package:flutter/widgets.dart';
import 'package:ftp/core/widgets/cupertino_app.dart';
import 'package:ftp/core/widgets/material_app.dart';
import 'package:ftp/core/widgets/platform_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => PlatformStyle(
        cupertino: (_) => const MyCupertinoApp(),
        material: (_) => const MyMaterialApp(),
      );
}
