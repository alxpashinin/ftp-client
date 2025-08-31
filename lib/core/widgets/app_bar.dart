import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({this.title, Key? key}) : super(key: key);

  final Widget? title;

  @override
  Widget build(BuildContext context) =>
      AppBar(title: title, leading: const AutoLeadingButton());

  @override
  Size get preferredSize => const Size.fromHeight(30);
}
