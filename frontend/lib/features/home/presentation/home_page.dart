import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:aurabus/routing/router.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  const HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexFromLocation(BuildContext context) {
    final loc = GoRouterState.of(context).uri.toString();
    if (loc.startsWith(AppRoute.tickets)) return 0;
    if (loc.startsWith(AppRoute.map)) return 1;
    if (loc.startsWith(AppRoute.account)) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _indexFromLocation(context);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) {
          switch (i) {
            case 0:
              context.go(AppRoute.tickets);
              break;
            case 1:
              context.go(AppRoute.map);
              break;
            case 2:
              context.go(AppRoute.account);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number_outlined),
            label: "Tickets",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: "Map"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
