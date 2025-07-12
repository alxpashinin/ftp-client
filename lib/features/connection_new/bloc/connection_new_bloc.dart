import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/data/storage/drift/ftp.dart';

part 'connection_new_event.dart';
part 'connection_new_state.dart';

final class ConnectionNewBloc
    extends Bloc<ConnectionNewEvent, ConnectionNewState> {
  ConnectionNewBloc({
    required this.ftpClient,
    required this.ftpStorage,
  }) : super(const ConnectionNewInitial()) {
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
      :username,
      :password,
    ) = event;

    final result = await ftpClient.connect(
      server: server,
      username: username,
      password: password,
    );

    switch (result) {
      case FtpConnectResult.success:
        await ftpStorage.saveFtpCreds(
          (
            server: server,
            username: username,
            password: password,
          ),
        );
      default:
    }

    emitter(ConnectionNewSuccess(ftpConnectResult: result));
  }
}
