import 'package:ftp/core/data/storage/drift/drift.dart';

enum FtpConnectResult {
  success,
  failure,
}

typedef FtpCredsRecord = ({
  String server,
  String username,
  String password,
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
}
