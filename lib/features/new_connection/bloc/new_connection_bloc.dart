import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';

part 'new_connection_event.dart';
part 'new_connection_state.dart';

final class NewConnectionBloc
    extends Bloc<NewConnectionEvent, NewConnectionState> {
  NewConnectionBloc({
    required this.ftpClient,
  }) : super(const NewConnectionInitial()) {
    on<NewConnectionOnSubmitButtonTapped>(_onSubmitButtonTapped);
  }

  FtpClient ftpClient;

  Future<void> _onSubmitButtonTapped(
    NewConnectionOnSubmitButtonTapped event,
    Emitter<NewConnectionState> emitter,
  ) async {
    final result = await ftpClient.connect(
      server: event.server,
      username: event.username,
      password: event.password,
    );

    emitter(
      NewConnectionSuccess(ftpConnectResult: result),
    );
  }
}
