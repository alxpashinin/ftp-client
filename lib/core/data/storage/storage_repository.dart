import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/data/storage/drift/drift.dart';
import 'package:ftp/core/data/storage/ftp_storage.dart';

final class StorageRepository implements FtpStorage {
  StorageRepository({required this.driftDb});

  final DriftDb driftDb;

  late final _ftpStream = driftDb.managers.ftpCredsItems
      .watch()
      .asBroadcastStream();

  @override
  Stream<List<FtpCredsItem>> get ftpStream => _ftpStream;

  @override
  Future<List<FtpCredsItem>> getListFtpCreds() async =>
      await driftDb.managers.ftpCredsItems.get();

  @override
  Future<void> saveFtpCreds(FtpCredsRecord credsRecord) =>
      driftDb.managers.ftpCredsItems.create(
        (f) => f(
          server: credsRecord.server,
          port: credsRecord.port,
          username: credsRecord.username,
          password: credsRecord.password,
          securityType: credsRecord.securityType,
        ),
      );

  @override
  Future<void> deleteFtpCreds(FtpCredsItem creds) =>
      driftDb.managers.ftpCredsItems.filter((f) => f.id(creds.id)).delete();
}
