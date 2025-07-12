import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'drift.g.dart';

@DriftDatabase(tables: [FtpCredsItems])
class DriftDb extends _$DriftDb {
  DriftDb([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() => driftDatabase(
        name: 'drift_db',
        native: const DriftNativeOptions(
          databaseDirectory: getApplicationSupportDirectory,
        ),
      );
}

mixin TableMixin on Table {
  // Primary key column
  IntColumn get id => integer().autoIncrement()();

  // Column for created at timestamp
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class FtpCredsItems extends Table with TableMixin {
  TextColumn get server => text()();
  TextColumn get username => text()();
  TextColumn get password => text()();
}
