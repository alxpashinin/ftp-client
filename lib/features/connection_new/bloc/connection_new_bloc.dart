import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/data/storage/ftp_storage.dart';

part 'connection_new_event.dart';
part 'connection_new_state.dart';

final class ConnectionNewBloc
    extends Bloc<ConnectionNewEvent, ConnectionNewState> {
  ConnectionNewBloc({required this.ftpClient, required this.ftpStorage})
    : super(const ConnectionNewInitial()) {
    on<ConnectionNewSubmitButtonTapped>(_onSubmitButtonTapped);
  }

  FtpClient ftpClient;

  FtpStorage ftpStorage;

  Future<void> _onSubmitButtonTapped(
    ConnectionNewSubmitButtonTapped event,
    Emitter<ConnectionNewState> emitter,
  ) async {
    final ConnectionNewSubmitButtonTapped(
      :server,
      :port,
      :username,
      :password,
      :securityType,
      :completer,
    ) = event;

    try {
      final result = await ftpClient.connect(
        credsRecord: (
          server: server,
          port: port,
          username: username,
          password: password,
          securityType: securityType,
        ),
      );

      switch (result) {
        case FtpConnectResult.success:
          await ftpStorage.saveFtpCreds((
            server: server,
            port: port,
            username: username,
            password: password,
            securityType: securityType,
          ));
        default:
      }

      completer.complete;
      emitter(ConnectionNewSuccess(ftpConnectResult: result));
    } on Exception catch (e) {
      emitter(ConnectionNewFailure(e));
    }
  }
}
