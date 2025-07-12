part of 'connection_new_bloc.dart';

/// Bloc Events for [ConnectionNewBloc]
sealed class ConnectionNewEvent {
  const ConnectionNewEvent();
}

final class ConnectionNewStarted extends ConnectionNewEvent {
  const ConnectionNewStarted();
}

final class ConnectionNewSubmitButtonTapped extends ConnectionNewEvent {
  ConnectionNewSubmitButtonTapped({
    required this.server,
    required this.username,
    required this.password,
  });

  final String server;

  final String username;

  final String password;
}
