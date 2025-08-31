import 'package:flutter/foundation.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/data/models/ftp_file.dart';
import 'package:ftp/core/data/storage/drift/drift.dart';
import 'package:ftp/core/utils/talker.dart';
import 'package:ftpconnect/ftpconnect.dart';

/// FTP client implementation, used [FTPConnect]
final class FtpConnectClient implements FtpClient {
  FTPConnect? _ftpConnect;

  @override
  Future<FtpConnectResult> connect({
    FtpCredsItem? creds,
    FtpCredsRecord? credsRecord,
  }) async {
    assert(
      creds != null || credsRecord != null,
      '[creds] or [connectFtpCreds] must not be null',
    );

    final (server, port, username, password, securityType) = (
      creds?.server ?? credsRecord!.server,
      creds?.port ?? credsRecord!.port,
      creds?.username ?? credsRecord!.username,
      creds?.password ?? credsRecord!.password,
      creds?.securityType ?? credsRecord!.securityType,
    );

    try {
      _ftpConnect =
          FTPConnect(
              server,
              port: port,
              user: username,
              pass: password,
              showLog: kDebugMode,
              timeout: 5,
              securityType: switch (securityType) {
                FtpSecurityType.ftp => SecurityType.ftp,
                FtpSecurityType.ftps => SecurityType.ftps,
                FtpSecurityType.ftpes => SecurityType.ftpes,
              },
            )
            ..listCommand = ListCommand.list
            ..transferMode = TransferMode.passive;

      talker.info('[FtpClientImpl.connect()] connecting to ${server}');

      return await _ftpConnect!.connect()
          ? FtpConnectResult.success
          : FtpConnectResult.failure;
    } on Exception catch (e, st) {
      talker.handle(e, st);
      rethrow;
    }
  }

  @override
  Future<bool> disconnect() async {
    assert(
      _ftpConnect != null,
      'Call [FtpClientImpl.connect()] before this method',
    );

    try {
      talker.info('[FtpClientImpl.disconnect()] disconnecting');
      return await _ftpConnect!.disconnect();
    } on Exception catch (e, st) {
      talker.info(e, st);

      return false;
    }
  }

  @override
  Future<List<FtpFile>> getFiles() async {
    assert(
      _ftpConnect != null,
      'Call [FtpClientImpl.connect()] before this method',
    );

    final result = await _ftpConnect!.listDirectoryContent();
    return result.map(FtpFile.fromFtpConnect).toList();
  }
}
