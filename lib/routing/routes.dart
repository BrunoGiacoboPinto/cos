import 'package:cos/home/widgets/home_screen.dart';
import 'package:cos/vehicle_auction/widgets/auction_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  home('/home'),
  auction('/auction');

  const AppRoutes(this.path);
  final String path;
}

GoRouter buildAppRouter() {
  return GoRouter(
    initialLocation: AppRoutes.home.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: SafeArea(child: child),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.gavel),
                  label: 'Auction',
                ),
              ],
              currentIndex: AppRoutes.values.indexWhere(
                (route) => route.path == state.uri.path,
              ),
              onTap: (index) {
                if (index == 0) {
                  context.go(AppRoutes.home.path);
                } else {
                  context.go(AppRoutes.auction.path);
                }
              },
            ),
          );
        },
        routes: [
          GoRoute(
            path: AppRoutes.home.path,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.auction.path,
            builder: (context, state) => VehicleAuctionScreen(),
          ),
        ],
      ),
    ],
  );
}
