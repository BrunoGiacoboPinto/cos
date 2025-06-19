import 'package:collection/collection.dart';
import 'package:cos/domain/model/car_auction.dart';
import 'package:cos/home/widgets/home_screen.dart';
import 'package:cos/home/widgets/home_screen_appbar.dart';
import 'package:cos/login/widgets/login_screen.dart';
import 'package:cos/routing/transitions.dart';
import 'package:cos/ui/core/ui/theme/button.dart';
import 'package:cos/ui/core/ui/theme/colors.dart';
import 'package:cos/ui/core/ui/theme/spacing.dart';
import 'package:cos/vehicle_auction/widgets/vehicle_auction_screen.dart';
import 'package:cos/vehicle_auction_detail/vehicle_auction_detail.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  home('/home'),
  auction('/auction'),
  details('/details'),
  login('/login');

  const AppRoutes(this.path);
  final String path;

  static int bottomNavigationIndexFor(String path) {
    if (path == details.path || path == login.path) {
      return 0;
    } else {
      return values.indexWhere(
        (route) => route.path == path,
      );
    }
  }

  static AppRoutes? fromPath(String path) {
    return values.firstWhereOrNull((route) => route.path == path);
  }
}

GoRouter buildAppRouter(GetIt dependencies) {
  return GoRouter(
    initialLocation: AppRoutes.login.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final preferredSize = AppRoutes.auction.path == state.uri.path ? const Size.fromHeight(64.0) : const Size.fromHeight(96.0);
          return Scaffold(
            appBar: AppRoutes.details.path == state.uri.path
                ? null
                : PreferredSize(
                    preferredSize: preferredSize,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(
                        horizontal: spaceMd,
                        vertical: spaceSm,
                      ),
                      child: switch (AppRoutes.fromPath(state.uri.path)) {
                        AppRoutes.home => HomeScreenAppbar(viewModel: dependencies.get()),
                        AppRoutes.auction => Text(
                          'Last Auctions',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: lightBlue,
                          ),
                        ),
                        _ => const SizedBox.shrink(),
                      },
                    ),
                  ),
            backgroundColor: Theme.of(context).colorScheme.onSurface,
            body: SafeArea(child: child),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                splashFactory: const LimitedRadiusSplashFactory(),
              ),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: darkGray,
                items: const [
                  // TODO(bpinto): Use l10n for labels
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.gavel),
                    label: 'Auctions',
                  ),
                ],
                currentIndex: AppRoutes.bottomNavigationIndexFor(state.uri.path),
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
      GoRoute(
        path: AppRoutes.details.path,
        pageBuilder: (context, state) {
          final Widget child;
          if (state.extra case final CarAuctionWithDataModel model?) {
            child = VehicleAuctionDetail(model: model);
          } else {
            child = const Center(
              child: Text('Fail to get details for the vehicle auction.'),
            );
          }

          return MaterialPage(child: child);
        },
      ),
      GoRoute(
        path: AppRoutes.login.path,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: LoginScreen(viewModel: dependencies.get()),
          );
        },
      ),
    ],
  );
}
