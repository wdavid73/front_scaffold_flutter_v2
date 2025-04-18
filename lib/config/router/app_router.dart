import 'package:go_router/go_router.dart';
import 'package:front_scaffold_flutter_v2/ui/blocs/blocs.dart';
import 'go_router_notifier.dart';
import 'redirect_handler.dart';
import 'routes_constants.dart';
import 'routes_generator.dart';

/// Creates and configures the application's [GoRouter] instance.
///
/// This function initializes the [GoRouter] with the application's routes,
/// initial location, refresh listener, and redirection logic. It uses a
/// [GoRouterNotifier] to listen for changes in the authentication state and
/// the [appRedirect] function to handle redirection based on the current
/// authentication status and route.
///
/// Parameters:
///   - [authBloc]: The [AuthBloc] instance used to manage the authentication state.
///
/// Returns:
///   - A configured [GoRouter] instance ready to be used in the application.
GoRouter createAppRouter(AuthBloc authBloc) {
  final goRouterNotifier = GoRouterNotifier(authBloc);

  return GoRouter(
    /*initialLocation: RouteConstants.splash,*/
    initialLocation: RouteConstants.home,
    refreshListenable: goRouterNotifier,
    routes: AppRoutes.getAppRoutes(),
    redirect: (context, state) => null /*appRedirect(goRouterNotifier, state)*/,
  );
}