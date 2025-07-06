enum FtpConnectResult {
  success,
  failure,
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

  /// Disconnect from the current FTP server
  ///
  /// Return [true] is success, overwise return [false]
  Future<bool> disconnect();
}
