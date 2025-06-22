import 'dart:io' show Platform;
import 'package:flutter/widgets.dart';

class PlatformStyle extends StatelessWidget {
  const PlatformStyle({
    required this.cupertino,
    required this.material,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext) cupertino;

  final Widget Function(BuildContext) material;

  @override
  Widget build(BuildContext context) =>
      Platform.isIOS || Platform.isMacOS
          ? cupertino(context)
          : material(context);
}
