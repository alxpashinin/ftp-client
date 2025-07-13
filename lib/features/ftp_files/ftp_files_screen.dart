import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/data/storage/drift/drift.dart';
import 'package:ftp/core/widgets/loading_screen.dart';
import 'package:ftp/features/ftp_files/bloc/ftp_files_bloc.dart';

@RoutePage()
class FtpFilesScreen extends StatelessWidget implements AutoRouteWrapper {
  const FtpFilesScreen({
    required this.ftpCreds,
    Key? key,
  }) : super(key: key);

  final FtpCredsItem ftpCreds;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FtpFilesBloc, FtpFilesState>(
        builder: (context, state) => switch (state) {
          final FtpFilesSuccess state => Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(),
                ],
              ),
            ),
          _ => const MyLoadingScreen(),
        },
      );

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => FtpFilesBloc(
          ftpClient: context.read<FtpClient>(),
        )..add(FtpFilesStarted(ftpCreds: ftpCreds)),
        child: this,
      );
}
