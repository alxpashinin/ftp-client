import 'package:ftp/core/data/storage/drift/drift.dart';
import 'package:ftp/core/data/storage/drift/ftp.dart';

final class StorageRepository implements FtpStorage {
  StorageRepository({
    required this.driftDb,
  });

  final DriftDb driftDb;

  late final _ftpStream = driftDb.managers.ftpCredsItems
      .watch()
      .asBroadcastStream()
      .map((v) => v.map(FtpCreds.fromDrift).toList());

  @override
  Stream<List<FtpCreds>> get ftpStream => _ftpStream;

  @override
  Future<List<FtpCreds>> getListFtpCreds() async {
    final result = await driftDb.managers.ftpCredsItems.get();
    return result.map(FtpCreds.fromDrift).toList();
  }

  @override
  Future<void> saveFtpCreds(SaveFtpCreds creds) =>
      driftDb.managers.ftpCredsItems.create(
        (f) => f(
          server: creds.server,
          username: creds.username,
          password: creds.password,
        ),
      );

  @override
  Future<void> deleteFtpCreds(FtpCreds creds) =>
      driftDb.managers.ftpCredsItems.filter((f) => f.id(creds.id)).delete();
}
