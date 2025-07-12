import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ftp/core/data/storage/drift/drift.dart';

part 'ftp.freezed.dart';

typedef SaveFtpCreds = ({String server, String username, String password});

abstract interface class FtpStorage {
  Stream<List<FtpCreds>> get ftpStream;

  Future<List<FtpCreds>> getListFtpCreds();

  Future<void> saveFtpCreds(SaveFtpCreds creds);

  Future<void> deleteFtpCreds(FtpCreds creds);
}

@freezed
abstract class FtpCreds with _$FtpCreds {
  const factory FtpCreds({
    required int id,
    required String server,
    required String username,
    required String password,
    required DateTime createdAt,
  }) = _FtpCreds;

  factory FtpCreds.fromDrift(FtpCredsItem item) => FtpCreds(
        id: item.id,
        server: item.server,
        username: item.username,
        password: item.password,
        createdAt: item.createdAt,
      );
}
