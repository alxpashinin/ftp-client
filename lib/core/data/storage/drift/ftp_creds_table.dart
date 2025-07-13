part of 'drift.dart';

class FtpCredsItems extends Table with TableMixin {
  TextColumn get server => text()();
  TextColumn get username => text()();
  TextColumn get password => text()();
}
