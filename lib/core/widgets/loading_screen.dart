import 'package:flutter/material.dart';
import 'package:ftp/core/widgets/app_bar.dart';

class MyLoadingScreen extends StatelessWidget {
  const MyLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: MyAppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
