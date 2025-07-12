import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/storage/drift/ftp.dart';
import 'package:ftp/core/widgets/app_bar.dart';
import 'package:ftp/features/ftp_files/bloc/ftp_files_bloc.dart';

@RoutePage()
class FtpFilesScreen extends StatelessWidget implements AutoRouteWrapper {
  const FtpFilesScreen({
    required this.ftpCreds,
    Key? key,
  }) : super(key: key);

  final FtpCreds ftpCreds;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(),
        body: Column(),
      );

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) =>
            FtpFilesBloc(ftpCreds: ftpCreds)..add(const FtpFilesStarted()),
        child: this,
      );
}
