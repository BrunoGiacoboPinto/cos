import 'package:cos/home/widgets/home_screen.dart';
import 'package:cos/routing/transitions.dart';
import 'package:cos/ui/core/ui/theme/button.dart';
import 'package:cos/ui/core/ui/theme/colors.dart';
import 'package:cos/vehicle_auction/widgets/vehicle_auction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  home('/home'),
  auction('/auction');

  const AppRoutes(this.path);
  final String path;
}

GoRouter buildAppRouter(GetIt dependencies) {
  return GoRouter(
    initialLocation: AppRoutes.home.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            backgroundColor: darkGray,
            body: SafeArea(child: child),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                splashFactory: const LimitedRadiusSplashFactory(),
              ),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: darkGray,
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
                  context.go(AppRoutes.values[index % AppRoutes.values.length].path);
                },
              ),
            ),
          );
        },
        routes: [
          GoRoute(
            path: AppRoutes.home.path,
            pageBuilder: (context, state) {
              return PageViewTransitionPage(
                child: HomeScreen(viewModel: dependencies.get()),
                pageKey: state.pageKey,
                pageIndex: AppRoutes.home.index,
              );
            },
          ),
          GoRoute(
            path: AppRoutes.auction.path,
            pageBuilder: (context, state) {
              return PageViewTransitionPage(
                child: VehicleAuctionScreen(viewModel: dependencies.get()),
                pageKey: state.pageKey,
                pageIndex: AppRoutes.auction.index,
              );
            },
          ),
        ],
      ),
    ],
  );
}
