import 'package:auto_route/auto_route.dart';
import 'package:ftp/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: ConnectionListRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: ConnectionNewRoute.page,
        ),
        AutoRoute(
          page: FtpFilesRoute.page,
        ),
      ];
}
