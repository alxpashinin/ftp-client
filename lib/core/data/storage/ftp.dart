import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/data/storage/drift/drift.dart';

abstract interface class FtpStorage {
  Stream<List<FtpCredsItem>> get ftpStream;

  Future<List<FtpCredsItem>> getListFtpCreds();

  Future<void> saveFtpCreds(FtpCredsRecord credsRecord);

  Future<void> deleteFtpCreds(FtpCredsItem creds);
}
