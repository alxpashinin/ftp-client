enum FtpConnectResult {
  success,
  failed,
}

abstract interface class FtpClient {
  /// Connect to FTP server
  ///
  /// Return [true] is success, overwise return [false]
  Future<FtpConnectResult> connect({
    required String server,
    required String username,
    required String password,
  });

  Future<void> disconnect();
}
