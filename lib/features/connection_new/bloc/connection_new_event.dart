part of 'connection_new_bloc.dart';

/// Bloc Events for [ConnectionNewBloc]
sealed class ConnectionNewEvent {
  const ConnectionNewEvent();
}

final class ConnectionNewSubmitButtonTapped extends ConnectionNewEvent {
  ConnectionNewSubmitButtonTapped({
    required this.server,
    required this.port,
    required this.username,
    required this.password,
    required this.securityType,
    required this.completer,
  });

  final String server;

  final int port;

  final String username;

  final String password;

  final FtpSecurityType securityType;

  final Completer<void> completer;
}
