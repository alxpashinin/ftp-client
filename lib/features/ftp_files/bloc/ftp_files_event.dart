part of 'ftp_files_bloc.dart';

/// Bloc Events for [FtpFilesBloc]
sealed class FtpFilesEvent {
  const FtpFilesEvent();
}

final class FtpFilesStarted extends FtpFilesEvent {
  FtpFilesStarted({required this.ftpCreds});

  final FtpCredsItem ftpCreds;
}
