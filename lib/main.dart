import 'package:flutter/material.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/data/ftp/ftp_client_impl.dart';
import 'package:ftp/core/l10n/gen/app_localizations.g.dart';
import 'package:ftp/core/router/app_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _router = AppRouter();

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<FtpClient>(
            create: (context) => FtpClientImpl(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: _router.config(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 18, 79, 33),
              contrastLevel: 0.5,
              brightness: Brightness.dark,
            ),
            textTheme: GoogleFonts.latoTextTheme(const TextTheme()),
          ),
        ),
      );
}
