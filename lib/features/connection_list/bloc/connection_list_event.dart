part of 'connection_list_bloc.dart';

/// Bloc Events for [ConnectionListBloc]
sealed class ConnectionListEvent {
  const ConnectionListEvent();
}

final class ConnectionListStarted extends ConnectionListEvent {
  const ConnectionListStarted();
}

final class ConnectionListFtpChanged extends ConnectionListEvent {
  ConnectionListFtpChanged({required this.newCreds});

  final List<FtpCreds> newCreds;
}
