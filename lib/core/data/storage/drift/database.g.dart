// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FtpCredsItemsTable extends FtpCredsItems
    with TableInfo<$FtpCredsItemsTable, FtpCredsItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FtpCredsItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _serverMeta = const VerificationMeta('server');
  @override
  late final GeneratedColumn<String> server = GeneratedColumn<String>(
      'server', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, server, username, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ftp_creds_items';
  @override
  VerificationContext validateIntegrity(Insertable<FtpCredsItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('server')) {
      context.handle(_serverMeta,
          server.isAcceptableOrUnknown(data['server']!, _serverMeta));
    } else if (isInserting) {
      context.missing(_serverMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FtpCredsItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FtpCredsItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      server: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}server'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $FtpCredsItemsTable createAlias(String alias) {
    return $FtpCredsItemsTable(attachedDatabase, alias);
  }
}

class FtpCredsItem extends DataClass implements Insertable<FtpCredsItem> {
  final int id;
  final String server;
  final String username;
  final String password;
  const FtpCredsItem(
      {required this.id,
      required this.server,
      required this.username,
      required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['server'] = Variable<String>(server);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    return map;
  }

  FtpCredsItemsCompanion toCompanion(bool nullToAbsent) {
    return FtpCredsItemsCompanion(
      id: Value(id),
      server: Value(server),
      username: Value(username),
      password: Value(password),
    );
  }

  factory FtpCredsItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FtpCredsItem(
      id: serializer.fromJson<int>(json['id']),
      server: serializer.fromJson<String>(json['server']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'server': serializer.toJson<String>(server),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
    };
  }

  FtpCredsItem copyWith(
          {int? id, String? server, String? username, String? password}) =>
      FtpCredsItem(
        id: id ?? this.id,
        server: server ?? this.server,
        username: username ?? this.username,
        password: password ?? this.password,
      );
  FtpCredsItem copyWithCompanion(FtpCredsItemsCompanion data) {
    return FtpCredsItem(
      id: data.id.present ? data.id.value : this.id,
      server: data.server.present ? data.server.value : this.server,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FtpCredsItem(')
          ..write('id: $id, ')
          ..write('server: $server, ')
          ..write('username: $username, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, server, username, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FtpCredsItem &&
          other.id == this.id &&
          other.server == this.server &&
          other.username == this.username &&
          other.password == this.password);
}

class FtpCredsItemsCompanion extends UpdateCompanion<FtpCredsItem> {
  final Value<int> id;
  final Value<String> server;
  final Value<String> username;
  final Value<String> password;
  const FtpCredsItemsCompanion({
    this.id = const Value.absent(),
    this.server = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
  });
  FtpCredsItemsCompanion.insert({
    this.id = const Value.absent(),
    required String server,
    required String username,
    required String password,
  })  : server = Value(server),
        username = Value(username),
        password = Value(password);
  static Insertable<FtpCredsItem> custom({
    Expression<int>? id,
    Expression<String>? server,
    Expression<String>? username,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (server != null) 'server': server,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
    });
  }

  FtpCredsItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? server,
      Value<String>? username,
      Value<String>? password}) {
    return FtpCredsItemsCompanion(
      id: id ?? this.id,
      server: server ?? this.server,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (server.present) {
      map['server'] = Variable<String>(server.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FtpCredsItemsCompanion(')
          ..write('id: $id, ')
          ..write('server: $server, ')
          ..write('username: $username, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FtpCredsItemsTable ftpCredsItems = $FtpCredsItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [ftpCredsItems];
}

typedef $$FtpCredsItemsTableCreateCompanionBuilder = FtpCredsItemsCompanion
    Function({
  Value<int> id,
  required String server,
  required String username,
  required String password,
});
typedef $$FtpCredsItemsTableUpdateCompanionBuilder = FtpCredsItemsCompanion
    Function({
  Value<int> id,
  Value<String> server,
  Value<String> username,
  Value<String> password,
});

class $$FtpCredsItemsTableFilterComposer
    extends Composer<_$AppDatabase, $FtpCredsItemsTable> {
  $$FtpCredsItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get server => $composableBuilder(
      column: $table.server, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));
}

class $$FtpCredsItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $FtpCredsItemsTable> {
  $$FtpCredsItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get server => $composableBuilder(
      column: $table.server, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));
}

class $$FtpCredsItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FtpCredsItemsTable> {
  $$FtpCredsItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get server =>
      $composableBuilder(column: $table.server, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);
}

class $$FtpCredsItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FtpCredsItemsTable,
    FtpCredsItem,
    $$FtpCredsItemsTableFilterComposer,
    $$FtpCredsItemsTableOrderingComposer,
    $$FtpCredsItemsTableAnnotationComposer,
    $$FtpCredsItemsTableCreateCompanionBuilder,
    $$FtpCredsItemsTableUpdateCompanionBuilder,
    (
      FtpCredsItem,
      BaseReferences<_$AppDatabase, $FtpCredsItemsTable, FtpCredsItem>
    ),
    FtpCredsItem,
    PrefetchHooks Function()> {
  $$FtpCredsItemsTableTableManager(_$AppDatabase db, $FtpCredsItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FtpCredsItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FtpCredsItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FtpCredsItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> server = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> password = const Value.absent(),
          }) =>
              FtpCredsItemsCompanion(
            id: id,
            server: server,
            username: username,
            password: password,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String server,
            required String username,
            required String password,
          }) =>
              FtpCredsItemsCompanion.insert(
            id: id,
            server: server,
            username: username,
            password: password,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FtpCredsItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FtpCredsItemsTable,
    FtpCredsItem,
    $$FtpCredsItemsTableFilterComposer,
    $$FtpCredsItemsTableOrderingComposer,
    $$FtpCredsItemsTableAnnotationComposer,
    $$FtpCredsItemsTableCreateCompanionBuilder,
    $$FtpCredsItemsTableUpdateCompanionBuilder,
    (
      FtpCredsItem,
      BaseReferences<_$AppDatabase, $FtpCredsItemsTable, FtpCredsItem>
    ),
    FtpCredsItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FtpCredsItemsTableTableManager get ftpCredsItems =>
      $$FtpCredsItemsTableTableManager(_db, _db.ftpCredsItems);
}
