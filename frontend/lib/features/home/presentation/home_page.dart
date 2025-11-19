import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aurabus/routing/router.dart';
import 'package:aurabus/features/tickets/presentation/ticket_page.dart';
import 'package:aurabus/features/map/presentation/map_screen.dart';
import 'package:aurabus/features/account/presentation/account_page.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // All tabs kept alive
  final List<Widget> _pages = const [TicketPage(), MapScreen(), AccountPage()];

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(AppRoute.tickets)) return 0;
    if (location.startsWith(AppRoute.map)) return 1;
    if (location.startsWith(AppRoute.account)) return 2;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
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
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(context);

    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (i) => _onItemTapped(context, i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number_outlined),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
