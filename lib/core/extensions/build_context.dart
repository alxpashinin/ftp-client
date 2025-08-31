import 'package:flutter/material.dart';
import 'package:ftp/core/l10n/gen/app_localizations.g.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  AppLocalizations get loc => AppLocalizations.of(this)!;

  ScaffoldMessengerState get scaffoldMesenger => ScaffoldMessenger.of(this);
}
