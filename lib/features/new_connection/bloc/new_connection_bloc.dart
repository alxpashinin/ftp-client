import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/data/storage/drift/ftp.dart';

part 'new_connection_event.dart';
part 'new_connection_state.dart';

final class NewConnectionBloc
    extends Bloc<NewConnectionEvent, NewConnectionState> {
  NewConnectionBloc({
    required this.ftpClient,
    required this.ftpStorage,
  }) : super(const NewConnectionInitial()) {
    on<NewConnectionOnSubmitButtonTapped>(_onSubmitButtonTapped);
  }

  FtpClient ftpClient;

  FtpStorage ftpStorage;

  Future<void> _onSubmitButtonTapped(
    NewConnectionOnSubmitButtonTapped event,
    Emitter<NewConnectionState> emitter,
  ) async {
    final NewConnectionOnSubmitButtonTapped(
      :server,
      :username,
      :password,
    ) = event;

    final result = await ftpClient.connect(
      server: server,
      username: username,
      password: password,
    );

    if (result == FtpConnectResult.success) {
      await ftpStorage.saveFtpCreds(
        FtpCreds(
          server: server,
          username: username,
          password: password,
        ),
      );
    }

    emitter(
      NewConnectionSuccess(ftpConnectResult: result),
    );
  }
}
