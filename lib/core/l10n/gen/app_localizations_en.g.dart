// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get textFieldHintServer => 'Server';

  @override
  String get textFieldHintUsername => 'Username';

  @override
  String get textFieldHintPassword => 'Password';

  @override
  String get buttonTextConnect => 'Connect';

  @override
  String get validatorTextFieldIsEmpty => 'Field is empty';

  @override
  String get snackBarFTPConnectFailed => 'Something got wrong';

  @override
  String get connectionListIsEmpty => 'No available connections';
}
