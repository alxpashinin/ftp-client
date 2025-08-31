part of 'ftp_files_bloc.dart';

/// Bloc States for [FtpFilesBloc]
sealed class FtpFilesState {
  const FtpFilesState();
}

final class FtpFilesInitial extends FtpFilesState {
  const FtpFilesInitial();
}

final class FtpFilesLoading extends FtpFilesState {
  const FtpFilesLoading();
}

final class FtpFilesSuccess extends FtpFilesState {
  FtpFilesSuccess({
    required this.creds,
    required this.files,
  });

  final FtpCredsItem creds;

  final List<FtpFile> files;
}

final class FtpFilesFailure extends FtpFilesState {
  FtpFilesFailure({required this.exception});

  final Exception exception;
}
