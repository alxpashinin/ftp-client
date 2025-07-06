import 'package:ftp/core/data/storage/drift/database.dart';
import 'package:ftp/core/data/storage/drift/ftp.dart';

final class StorageRepostory implements FtpStorage {
  StorageRepostory({
    required this.appDatabase,
  });

  final AppDatabase appDatabase;

  @override
  Future<Iterable<FtpCreds>> getListFtpCreds() {
    // TODO: implement getListFtpCreds
    throw UnimplementedError();
  }

  @override
  Future<bool> saveFtpCreds(FtpCreds creds) {
    // TODO: implement saveFtpCreds
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteFtpCreds(FtpCreds creds) {
    // TODO: implement deleteFtpCreds
    throw UnimplementedError();
  }
}
