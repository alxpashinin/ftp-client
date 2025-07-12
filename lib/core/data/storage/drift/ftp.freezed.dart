// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ftp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FtpCreds {
  int get id;
  String get server;
  String get username;
  String get password;
  DateTime get createdAt;

  /// Create a copy of FtpCreds
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FtpCredsCopyWith<FtpCreds> get copyWith =>
      _$FtpCredsCopyWithImpl<FtpCreds>(this as FtpCreds, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FtpCreds &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, server, username, password, createdAt);

  @override
  String toString() {
    return 'FtpCreds(id: $id, server: $server, username: $username, password: $password, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $FtpCredsCopyWith<$Res> {
  factory $FtpCredsCopyWith(FtpCreds value, $Res Function(FtpCreds) _then) =
      _$FtpCredsCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String server,
      String username,
      String password,
      DateTime createdAt});
}

/// @nodoc
class _$FtpCredsCopyWithImpl<$Res> implements $FtpCredsCopyWith<$Res> {
  _$FtpCredsCopyWithImpl(this._self, this._then);

  final FtpCreds _self;
  final $Res Function(FtpCreds) _then;

  /// Create a copy of FtpCreds
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? server = null,
    Object? username = null,
    Object? password = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      server: null == server
          ? _self.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [FtpCreds].
extension FtpCredsPatterns on FtpCreds {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FtpCreds value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FtpCreds() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FtpCreds value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FtpCreds():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FtpCreds value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FtpCreds() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String server, String username, String password,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FtpCreds() when $default != null:
        return $default(_that.id, _that.server, _that.username, _that.password,
            _that.createdAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String server, String username, String password,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FtpCreds():
        return $default(_that.id, _that.server, _that.username, _that.password,
            _that.createdAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String server, String username, String password,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FtpCreds() when $default != null:
        return $default(_that.id, _that.server, _that.username, _that.password,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FtpCreds implements FtpCreds {
  const _FtpCreds(
      {required this.id,
      required this.server,
      required this.username,
      required this.password,
      required this.createdAt});

  @override
  final int id;
  @override
  final String server;
  @override
  final String username;
  @override
  final String password;
  @override
  final DateTime createdAt;

  /// Create a copy of FtpCreds
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FtpCredsCopyWith<_FtpCreds> get copyWith =>
      __$FtpCredsCopyWithImpl<_FtpCreds>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FtpCreds &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, server, username, password, createdAt);

  @override
  String toString() {
    return 'FtpCreds(id: $id, server: $server, username: $username, password: $password, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$FtpCredsCopyWith<$Res>
    implements $FtpCredsCopyWith<$Res> {
  factory _$FtpCredsCopyWith(_FtpCreds value, $Res Function(_FtpCreds) _then) =
      __$FtpCredsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String server,
      String username,
      String password,
      DateTime createdAt});
}

/// @nodoc
class __$FtpCredsCopyWithImpl<$Res> implements _$FtpCredsCopyWith<$Res> {
  __$FtpCredsCopyWithImpl(this._self, this._then);

  final _FtpCreds _self;
  final $Res Function(_FtpCreds) _then;

  /// Create a copy of FtpCreds
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? server = null,
    Object? username = null,
    Object? password = null,
    Object? createdAt = null,
  }) {
    return _then(_FtpCreds(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      server: null == server
          ? _self.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
