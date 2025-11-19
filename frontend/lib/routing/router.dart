import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:aurabus/features/home/presentation/home_page.dart';
import 'package:aurabus/features/tickets/presentation/ticket_page.dart';
import 'package:aurabus/features/map/presentation/map_screen.dart';
import 'package:aurabus/features/account/presentation/account_page.dart';

final _rootKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

class AppRoute {
  static const tickets = "/tickets";
  static const map = "/map";
  static const account = "/account";
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootKey,
    initialLocation: AppRoute.map,
    routes: [
      ShellRoute(
        navigatorKey: _shellKey,
        builder: (context, state, child) {
          return HomePage(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoute.tickets,
            builder: (_, __) => const TicketPage(),
          ),
          GoRoute(path: AppRoute.map, builder: (_, __) => const MapScreen()),
          GoRoute(
            path: AppRoute.account,
            builder: (_, __) => const AccountPage(),
          ),
        ],
      ),
    ],
  );
});
