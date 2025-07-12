part of 'connection_list_bloc.dart';

/// Bloc States for [ConnectionListBloc]
sealed class ConnectionListState {
  const ConnectionListState();
}

final class ConnectionListInitial extends ConnectionListState {
  const ConnectionListInitial();
}

final class ConnectionListLoading extends ConnectionListState {
  const ConnectionListLoading();
}

final class ConnectionListSuccess extends ConnectionListState {
  const ConnectionListSuccess({
    required this.ftpCredits,
  });

  final List<FtpCreds> ftpCredits;
}
