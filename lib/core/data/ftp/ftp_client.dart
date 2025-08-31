import 'package:ftp/core/data/models/ftp_file.dart';
import 'package:ftp/core/data/storage/drift/drift.dart';

enum FtpConnectResult { success, failure }

enum FtpSecurityType {
  ftp,
  ftps,
  ftpes;

  int get getDefaultPort => switch (this) {
    FtpSecurityType.ftps => 990,
    _ => 21,
  };
}

typedef FtpCredsRecord = ({
  String server,
  int port,
  String username,
  String password,
  FtpSecurityType securityType,
});

abstract interface class FtpClient {
  /// Connect to FTP server
  ///
  /// Return [true] is success, overwise return [false]
  Future<FtpConnectResult> connect({
    FtpCredsItem? creds,
    FtpCredsRecord? credsRecord,
  });

  /// Disconnect from the current FTP server
  ///
  /// Return [true] is success, overwise return [false]
  Future<bool> disconnect();

  /// Return [List] of [FtpFile] in current directory
  Future<List<FtpFile>> getFiles();
}
