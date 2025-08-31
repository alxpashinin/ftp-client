import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ftp/core/data/storage/drift/drift.dart';
import 'package:ftp/core/router/app_router.gr.dart';

class ConnectionListItem extends StatelessWidget {
  const ConnectionListItem(this.item, {Key? key}) : super(key: key);

  final FtpCredsItem item;

  @override
  Widget build(BuildContext context) => ListTile(
    onTap: () => context.router.push(FtpFilesRoute(ftpCreds: item)),
    title: Row(
      spacing: 20,
      children: [
        Text(item.server),
        Chip(label: Text(item.securityType.name.toUpperCase())),
      ],
    ),
    subtitle: Text(item.username),
    trailing: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.more_vert, size: 25),
    ),
  );
}
