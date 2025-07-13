import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/data/storage/drift/drift.dart';

part 'ftp_files_event.dart';
part 'ftp_files_state.dart';

final class FtpFilesBloc extends Bloc<FtpFilesEvent, FtpFilesState> {
  FtpFilesBloc({required FtpClient ftpClient})
      : _ftpClient = ftpClient,
        super(const FtpFilesInitial()) {
    on<FtpFilesStarted>(_onStarted);
  }

  final FtpClient _ftpClient;

  Future<void> _onStarted(
    FtpFilesStarted event,
    Emitter<FtpFilesState> emitter,
  ) async {
    final result = await _ftpClient.connect(creds: event.ftpCreds);

    switch (result) {
      case FtpConnectResult.success:
      case FtpConnectResult.failure:
    }
  }
}
