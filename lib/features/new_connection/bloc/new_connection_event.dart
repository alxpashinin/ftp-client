part of 'new_connection_bloc.dart';

/// Bloc Events for [NewConnectionBloc]
sealed class NewConnectionEvent {
  const NewConnectionEvent();
}

final class NewConnectionStarted extends NewConnectionEvent {
  const NewConnectionStarted();
}

final class NewConnectionOnSubmitButtonTapped extends NewConnectionEvent {
  NewConnectionOnSubmitButtonTapped({
    required this.server,
    required this.username,
    required this.password,
  });

  final String server;

  final String username;

  final String password;
}
