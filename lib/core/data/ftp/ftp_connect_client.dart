import 'package:flutter/foundation.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/utils/logger.dart';
import 'package:ftpconnect/ftpconnect.dart';

/// FTP client implementation, used [FTPConnect]
final class FtpConnectClient implements FtpClient {
  FTPConnect? _ftpConnect;

  @override
  Future<FtpConnectResult> connect({
    required String server,
    required String username,
    required String password,
  }) async {
    try {
      _ftpConnect = FTPConnect(
        server,
        user: username,
        pass: password,
        showLog: kDebugMode,
        timeout: 5,
      );

      logger.i('[FtpClientImpl.connect()] connecting to $server');
      return await _ftpConnect!.connect()
          ? FtpConnectResult.success
          : FtpConnectResult.failure;
    } on Exception catch (e, st) {
      logger.e(
        '[FtpClientImpl.connect()]',
        error: e,
        stackTrace: st,
      );

      return FtpConnectResult.failure;
    }
  }

  @override
  Future<bool> disconnect() async {
    assert(
      _ftpConnect != null,
      'Call [FtpClientImpl.connect()] before this method',
    );

    try {
      logger.i('[FtpClientImpl.disconnect()] disconnecting');
      return await _ftpConnect!.disconnect();
    } on Exception catch (e, st) {
      logger.e(
        '[FtpClientImpl.disconnect()]',
        error: e,
        stackTrace: st,
      );

      return false;
    }
  }
}
