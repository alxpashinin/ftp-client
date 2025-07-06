import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ftp/core/data/storage/drift/database.dart';

part 'ftp.freezed.dart';

abstract interface class FtpStorage {
  Future<Iterable<FtpCreds>> getListFtpCreds();

  Future<bool> saveFtpCreds(FtpCreds creds);

  Future<bool> deleteFtpCreds(FtpCreds creds);
}

@freezed
abstract class FtpCreds with _$FtpCreds {
  const factory FtpCreds({
    required String server,
    required String username,
    required String password,
  }) = _FtpCreds;

  factory FtpCreds.fromDrift(FtpCredsItem item) => FtpCreds(
        server: item.server,
        username: item.username,
        password: item.password,
      );
}
