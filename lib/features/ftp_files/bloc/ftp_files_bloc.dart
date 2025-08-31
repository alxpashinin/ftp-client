import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/data/models/ftp_file.dart';
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
    final connectResult = await _ftpClient.connect(creds: event.ftpCreds);

    switch (connectResult) {
      case FtpConnectResult.success:
        final files = await _ftpClient.getFiles();

        emitter(
          FtpFilesSuccess(
            creds: event.ftpCreds,
            files: files,
          ),
        );
      case FtpConnectResult.failure:
    }
  }
}
