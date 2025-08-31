part of 'drift.dart';

class FtpCredsItems extends Table with TableMixin {
  TextColumn get server => text()();

  IntColumn get port => integer()();

  TextColumn get username => text()();

  TextColumn get password => text()();

  IntColumn get securityType => intEnum<FtpSecurityType>()();
}
