import 'package:flutter/material.dart';

class MyLoadingScreen extends StatelessWidget {
  const MyLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
