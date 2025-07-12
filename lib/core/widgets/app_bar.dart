import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
        leading: const AutoLeadingButton(),
      );

  @override
  Size get preferredSize => const Size.fromHeight(30);
}
