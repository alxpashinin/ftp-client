import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/storage/drift/drift.dart';
import 'package:ftp/core/data/storage/ftp.dart';

part 'connection_list_event.dart';
part 'connection_list_state.dart';

final class ConnectionListBloc
    extends Bloc<ConnectionListEvent, ConnectionListState> {
  ConnectionListBloc({
    required FtpStorage ftpStorage,
  })  : _ftpStorage = ftpStorage,
        super(const ConnectionListInitial()) {
    on<ConnectionListStarted>(_onStarted);
    on<ConnectionListFtpChanged>(_onFtpChanged);

    _ftpChangedSub = _ftpStorage.ftpStream.skip(1).listen(
          (value) => add(ConnectionListFtpChanged(newCreds: value)),
        );
  }

  final FtpStorage _ftpStorage;

  StreamSubscription<List<FtpCredsItem>>? _ftpChangedSub;

  Future<void> _onStarted(
    ConnectionListStarted event,
    Emitter<ConnectionListState> emitter,
  ) async {
    emitter(const ConnectionListLoading());

    final result = await _ftpStorage.getListFtpCreds();
    emitter(ConnectionListSuccess(ftpCredits: result));
  }

  void _onFtpChanged(
    ConnectionListFtpChanged event,
    Emitter<ConnectionListState> emitter,
  ) {
    emitter(ConnectionListSuccess(ftpCredits: event.newCreds));
  }

  @override
  Future<void> close() {
    _ftpChangedSub?.cancel();
    return super.close();
  }
}
