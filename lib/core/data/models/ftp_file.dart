import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ftpconnect/ftpconnect.dart';

part 'ftp_file.freezed.dart';

@freezed
abstract class FtpFile with _$FtpFile {
  const factory FtpFile({
    required String name,
    required String? permission,
    required DateTime? modifiedAt,
    required int? size,
    required FtpFileType type,
  }) = _FtpFile;

  /// Convert [FTPEntry] into [FtpFile]
  static FtpFile fromFtpConnect(FTPEntry entry) => FtpFile(
    name: entry.name,
    permission: entry.permission,
    size: entry.size,
    modifiedAt: entry.modifyTime,
    type: switch (entry.type) {
      FTPEntryType.file => FtpFileType.file,
      FTPEntryType.dir => FtpFileType.directory,
      FTPEntryType.link => FtpFileType.link,
      FTPEntryType.unknown => FtpFileType.unknown,
    },
  );
}

enum FtpFileType { file, directory, link, unknown }
