import 'package:flutter/material.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/data/ftp/ftp_connect_client.dart';
import 'package:ftp/core/data/storage/drift/drift.dart';
import 'package:ftp/core/data/storage/storage_repository.dart';
import 'package:ftp/core/l10n/gen/app_localizations.g.dart';
import 'package:ftp/core/router/app_router.dart';
import 'package:ftp/core/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _router = AppRouter();

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      Provider<FtpClient>(create: (context) => FtpConnectClient()),
      Provider<StorageRepository>(
        create: (context) => StorageRepository(driftDb: DriftDb()),
      ),
    ],
    child: MaterialApp.router(
      routerConfig: _router.config(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: basicTheme,
    ),
  );
}
