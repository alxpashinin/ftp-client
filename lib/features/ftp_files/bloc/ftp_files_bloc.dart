import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/storage/drift/ftp.dart';

part 'ftp_files_event.dart';
part 'ftp_files_state.dart';

final class FtpFilesBloc extends Bloc<FtpFilesEvent, FtpFilesState> {
  FtpFilesBloc({required FtpCreds ftpCreds})
      : _ftpCreds = ftpCreds,
        super(const FtpFilesInitial()) {
    on<FtpFilesStarted>(_onStarted);
  }

  final FtpCreds _ftpCreds;

  Future<void> _onStarted(
      FtpFilesEvent event, Emitter<FtpFilesState> emitter) async {}
}
