import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/storage/storage_repository.dart';
import 'package:ftp/core/extensions/build_context.dart';
import 'package:ftp/core/router/app_router.gr.dart';
import 'package:ftp/core/widgets/app_bar.dart';
import 'package:ftp/core/widgets/loading_screen.dart';
import 'package:ftp/features/connection_list/bloc/connection_list_bloc.dart';
import 'package:ftp/features/connection_list/widgets/connection_list_item.dart';

@RoutePage()
class ConnectionListScreen extends StatelessWidget implements AutoRouteWrapper {
  const ConnectionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ConnectionListBloc, ConnectionListState>(
        builder: (context, state) => switch (state) {
          final ConnectionListSuccess state => Scaffold(
            appBar: const MyAppBar(),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => context.router.push(const ConnectionNewRoute()),
            ),
            body: state.ftpCredits.isEmpty
                ? Center(child: Text(context.loc.connectionListIsEmpty))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    itemCount: state.ftpCredits.length,
                    itemBuilder: (context, index) =>
                        ConnectionListItem(state.ftpCredits[index]),
                  ),
          ),
          _ => const MyLoadingScreen(),
        },
      );

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
    create: (context) =>
        ConnectionListBloc(ftpStorage: context.read<StorageRepository>())
          ..add(const ConnectionListStarted()),
    child: this,
  );
}
