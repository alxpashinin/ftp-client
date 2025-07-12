import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final basicTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 18, 79, 33),
    contrastLevel: 0.5,
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.latoTextTheme(const TextTheme()),
);
