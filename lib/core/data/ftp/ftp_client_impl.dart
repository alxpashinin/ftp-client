import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/utils/logger.dart';
import 'package:ftpconnect/ftpconnect.dart';

final class FtpClientImpl implements FtpClient {
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
        showLog: true,
        timeout: 5,
      );

      return await _ftpConnect!.connect()
          ? FtpConnectResult.success
          : FtpConnectResult.failed;
    } on Exception catch (e) {
      logger.e('[FtpClientImpl.connect]', error: e);
      return FtpConnectResult.failed;
    }
  }

  @override
  Future<void> disconnect() {
    // TODO: implement disconnect
    throw UnimplementedError();
  }
}
