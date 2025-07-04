import 'package:auto_route/auto_route.dart';
import 'package:ftp/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: NewConnectionRoute.page, initial: true),
      ];
}
