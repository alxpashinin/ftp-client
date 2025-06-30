part of 'new_connection_bloc.dart';

/// Bloc States for [NewConnectionBloc]
sealed class NewConnectionState {
  const NewConnectionState();
}

final class NewConnectionInitial extends NewConnectionState {
  const NewConnectionInitial();
}

final class NewConnectionSuccess extends NewConnectionState {
  const NewConnectionSuccess({required this.ftpConnectResult});

  final FtpConnectResult ftpConnectResult;
}
