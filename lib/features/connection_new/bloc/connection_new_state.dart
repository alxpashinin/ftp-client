part of 'connection_new_bloc.dart';

/// Bloc States for [ConnectionNewBloc]
sealed class ConnectionNewState {
  const ConnectionNewState();
}

final class ConnectionNewInitial extends ConnectionNewState {
  const ConnectionNewInitial();
}

final class ConnectionNewSuccess extends ConnectionNewState {
  const ConnectionNewSuccess({required this.ftpConnectResult});

  final FtpConnectResult ftpConnectResult;
}
