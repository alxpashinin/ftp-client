// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i6;
import 'package:ftp/core/data/storage/drift/drift.dart' as _i5;
import 'package:ftp/features/connection_list/connection_list_screen.dart'
    as _i1;
import 'package:ftp/features/connection_new/connection_new_screen.dart' as _i2;
import 'package:ftp/features/ftp_files/ftp_files_screen.dart' as _i3;

/// generated route for
/// [_i1.ConnectionListScreen]
class ConnectionListRoute extends _i4.PageRouteInfo<void> {
  const ConnectionListRoute({List<_i4.PageRouteInfo>? children})
    : super(ConnectionListRoute.name, initialChildren: children);

  static const String name = 'ConnectionListRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i4.WrappedRoute(child: const _i1.ConnectionListScreen());
    },
  );
}

/// generated route for
/// [_i2.ConnectionNewScreen]
class ConnectionNewRoute extends _i4.PageRouteInfo<void> {
  const ConnectionNewRoute({List<_i4.PageRouteInfo>? children})
    : super(ConnectionNewRoute.name, initialChildren: children);

  static const String name = 'ConnectionNewRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i4.WrappedRoute(child: const _i2.ConnectionNewScreen());
    },
  );
}

/// generated route for
/// [_i3.FtpFilesScreen]
class FtpFilesRoute extends _i4.PageRouteInfo<FtpFilesRouteArgs> {
  FtpFilesRoute({
    required _i5.FtpCredsItem ftpCreds,
    _i6.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         FtpFilesRoute.name,
         args: FtpFilesRouteArgs(ftpCreds: ftpCreds, key: key),
         initialChildren: children,
       );

  static const String name = 'FtpFilesRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FtpFilesRouteArgs>();
      return _i4.WrappedRoute(
        child: _i3.FtpFilesScreen(ftpCreds: args.ftpCreds, key: args.key),
      );
    },
  );
}

class FtpFilesRouteArgs {
  const FtpFilesRouteArgs({required this.ftpCreds, this.key});

  final _i5.FtpCredsItem ftpCreds;

  final _i6.Key? key;

  @override
  String toString() {
    return 'FtpFilesRouteArgs{ftpCreds: $ftpCreds, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FtpFilesRouteArgs) return false;
    return ftpCreds == other.ftpCreds && key == other.key;
  }

  @override
  int get hashCode => ftpCreds.hashCode ^ key.hashCode;
}
