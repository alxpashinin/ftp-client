// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift.dart';

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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _serverMeta = const VerificationMeta('server');
  @override
  late final GeneratedColumn<String> server = GeneratedColumn<String>(
    'server',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _portMeta = const VerificationMeta('port');
  @override
  late final GeneratedColumn<int> port = GeneratedColumn<int>(
    'port',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<FtpSecurityType, int>
  securityType = GeneratedColumn<int>(
    'security_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  ).withConverter<FtpSecurityType>($FtpCredsItemsTable.$convertersecurityType);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    server,
    port,
    username,
    password,
    securityType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ftp_creds_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<FtpCredsItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('server')) {
      context.handle(
        _serverMeta,
        server.isAcceptableOrUnknown(data['server']!, _serverMeta),
      );
    } else if (isInserting) {
      context.missing(_serverMeta);
    }
    if (data.containsKey('port')) {
      context.handle(
        _portMeta,
        port.isAcceptableOrUnknown(data['port']!, _portMeta),
      );
    } else if (isInserting) {
      context.missing(_portMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
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
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      server:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}server'],
          )!,
      port:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}port'],
          )!,
      username:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}username'],
          )!,
      password:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}password'],
          )!,
      securityType: $FtpCredsItemsTable.$convertersecurityType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}security_type'],
        )!,
      ),
    );
  }

  @override
  $FtpCredsItemsTable createAlias(String alias) {
    return $FtpCredsItemsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<FtpSecurityType, int, int> $convertersecurityType =
      const EnumIndexConverter<FtpSecurityType>(FtpSecurityType.values);
}

class FtpCredsItem extends DataClass implements Insertable<FtpCredsItem> {
  final int id;
  final DateTime createdAt;
  final String server;
  final int port;
  final String username;
  final String password;
  final FtpSecurityType securityType;
  const FtpCredsItem({
    required this.id,
    required this.createdAt,
    required this.server,
    required this.port,
    required this.username,
    required this.password,
    required this.securityType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['server'] = Variable<String>(server);
    map['port'] = Variable<int>(port);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    {
      map['security_type'] = Variable<int>(
        $FtpCredsItemsTable.$convertersecurityType.toSql(securityType),
      );
    }
    return map;
  }

  FtpCredsItemsCompanion toCompanion(bool nullToAbsent) {
    return FtpCredsItemsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      server: Value(server),
      port: Value(port),
      username: Value(username),
      password: Value(password),
      securityType: Value(securityType),
    );
  }

  factory FtpCredsItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FtpCredsItem(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      server: serializer.fromJson<String>(json['server']),
      port: serializer.fromJson<int>(json['port']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      securityType: $FtpCredsItemsTable.$convertersecurityType.fromJson(
        serializer.fromJson<int>(json['securityType']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'server': serializer.toJson<String>(server),
      'port': serializer.toJson<int>(port),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'securityType': serializer.toJson<int>(
        $FtpCredsItemsTable.$convertersecurityType.toJson(securityType),
      ),
    };
  }

  FtpCredsItem copyWith({
    int? id,
    DateTime? createdAt,
    String? server,
    int? port,
    String? username,
    String? password,
    FtpSecurityType? securityType,
  }) => FtpCredsItem(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    server: server ?? this.server,
    port: port ?? this.port,
    username: username ?? this.username,
    password: password ?? this.password,
    securityType: securityType ?? this.securityType,
  );
  FtpCredsItem copyWithCompanion(FtpCredsItemsCompanion data) {
    return FtpCredsItem(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      server: data.server.present ? data.server.value : this.server,
      port: data.port.present ? data.port.value : this.port,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      securityType:
          data.securityType.present
              ? data.securityType.value
              : this.securityType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FtpCredsItem(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('server: $server, ')
          ..write('port: $port, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('securityType: $securityType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    server,
    port,
    username,
    password,
    securityType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FtpCredsItem &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.server == this.server &&
          other.port == this.port &&
          other.username == this.username &&
          other.password == this.password &&
          other.securityType == this.securityType);
}

class FtpCredsItemsCompanion extends UpdateCompanion<FtpCredsItem> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> server;
  final Value<int> port;
  final Value<String> username;
  final Value<String> password;
  final Value<FtpSecurityType> securityType;
  const FtpCredsItemsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.server = const Value.absent(),
    this.port = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.securityType = const Value.absent(),
  });
  FtpCredsItemsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String server,
    required int port,
    required String username,
    required String password,
    required FtpSecurityType securityType,
  }) : server = Value(server),
       port = Value(port),
       username = Value(username),
       password = Value(password),
       securityType = Value(securityType);
  static Insertable<FtpCredsItem> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? server,
    Expression<int>? port,
    Expression<String>? username,
    Expression<String>? password,
    Expression<int>? securityType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (server != null) 'server': server,
      if (port != null) 'port': port,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (securityType != null) 'security_type': securityType,
    });
  }

  FtpCredsItemsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<String>? server,
    Value<int>? port,
    Value<String>? username,
    Value<String>? password,
    Value<FtpSecurityType>? securityType,
  }) {
    return FtpCredsItemsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      server: server ?? this.server,
      port: port ?? this.port,
      username: username ?? this.username,
      password: password ?? this.password,
      securityType: securityType ?? this.securityType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (server.present) {
      map['server'] = Variable<String>(server.value);
    }
    if (port.present) {
      map['port'] = Variable<int>(port.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (securityType.present) {
      map['security_type'] = Variable<int>(
        $FtpCredsItemsTable.$convertersecurityType.toSql(securityType.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FtpCredsItemsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('server: $server, ')
          ..write('port: $port, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('securityType: $securityType')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftDb extends GeneratedDatabase {
  _$DriftDb(QueryExecutor e) : super(e);
  $DriftDbManager get managers => $DriftDbManager(this);
  late final $FtpCredsItemsTable ftpCredsItems = $FtpCredsItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [ftpCredsItems];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$FtpCredsItemsTableCreateCompanionBuilder =
    FtpCredsItemsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required String server,
      required int port,
      required String username,
      required String password,
      required FtpSecurityType securityType,
    });
typedef $$FtpCredsItemsTableUpdateCompanionBuilder =
    FtpCredsItemsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<String> server,
      Value<int> port,
      Value<String> username,
      Value<String> password,
      Value<FtpSecurityType> securityType,
    });

class $$FtpCredsItemsTableFilterComposer
    extends Composer<_$DriftDb, $FtpCredsItemsTable> {
  $$FtpCredsItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get server => $composableBuilder(
    column: $table.server,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<FtpSecurityType, FtpSecurityType, int>
  get securityType => $composableBuilder(
    column: $table.securityType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$FtpCredsItemsTableOrderingComposer
    extends Composer<_$DriftDb, $FtpCredsItemsTable> {
  $$FtpCredsItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get server => $composableBuilder(
    column: $table.server,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get securityType => $composableBuilder(
    column: $table.securityType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FtpCredsItemsTableAnnotationComposer
    extends Composer<_$DriftDb, $FtpCredsItemsTable> {
  $$FtpCredsItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get server =>
      $composableBuilder(column: $table.server, builder: (column) => column);

  GeneratedColumn<int> get port =>
      $composableBuilder(column: $table.port, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FtpSecurityType, int> get securityType =>
      $composableBuilder(
        column: $table.securityType,
        builder: (column) => column,
      );
}

class $$FtpCredsItemsTableTableManager
    extends
        RootTableManager<
          _$DriftDb,
          $FtpCredsItemsTable,
          FtpCredsItem,
          $$FtpCredsItemsTableFilterComposer,
          $$FtpCredsItemsTableOrderingComposer,
          $$FtpCredsItemsTableAnnotationComposer,
          $$FtpCredsItemsTableCreateCompanionBuilder,
          $$FtpCredsItemsTableUpdateCompanionBuilder,
          (
            FtpCredsItem,
            BaseReferences<_$DriftDb, $FtpCredsItemsTable, FtpCredsItem>,
          ),
          FtpCredsItem,
          PrefetchHooks Function()
        > {
  $$FtpCredsItemsTableTableManager(_$DriftDb db, $FtpCredsItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$FtpCredsItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$FtpCredsItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$FtpCredsItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> server = const Value.absent(),
                Value<int> port = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<FtpSecurityType> securityType = const Value.absent(),
              }) => FtpCredsItemsCompanion(
                id: id,
                createdAt: createdAt,
                server: server,
                port: port,
                username: username,
                password: password,
                securityType: securityType,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required String server,
                required int port,
                required String username,
                required String password,
                required FtpSecurityType securityType,
              }) => FtpCredsItemsCompanion.insert(
                id: id,
                createdAt: createdAt,
                server: server,
                port: port,
                username: username,
                password: password,
                securityType: securityType,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FtpCredsItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftDb,
      $FtpCredsItemsTable,
      FtpCredsItem,
      $$FtpCredsItemsTableFilterComposer,
      $$FtpCredsItemsTableOrderingComposer,
      $$FtpCredsItemsTableAnnotationComposer,
      $$FtpCredsItemsTableCreateCompanionBuilder,
      $$FtpCredsItemsTableUpdateCompanionBuilder,
      (
        FtpCredsItem,
        BaseReferences<_$DriftDb, $FtpCredsItemsTable, FtpCredsItem>,
      ),
      FtpCredsItem,
      PrefetchHooks Function()
    >;

class $DriftDbManager {
  final _$DriftDb _db;
  $DriftDbManager(this._db);
  $$FtpCredsItemsTableTableManager get ftpCredsItems =>
      $$FtpCredsItemsTableTableManager(_db, _db.ftpCredsItems);
}
