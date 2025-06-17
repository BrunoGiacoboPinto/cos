import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class PageViewTransitionPage extends CustomTransitionPage {
  PageViewTransitionPage({
    required ValueKey<String> pageKey,
    required int pageIndex,
    required super.child,
  }) : super(
         key: pageKey,
         transitionDuration: const Duration(milliseconds: 250),
         reverseTransitionDuration: const Duration(milliseconds: 250),
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return _PageViewTransition(
             animation: animation,
             pageIndex: pageIndex,
             child: child,
           );
         },
       );
}

final class _PageViewTransition extends StatelessWidget {
  const _PageViewTransition({
    required this.animation,
    required this.pageIndex,
    required this.child,
  });

  final Animation<double> animation;
  final int pageIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.fastEaseInToSlowEaseOut,
    );

    final slideAnimation = Tween<Offset>(
      begin: Offset(pageIndex == 0 ? -1.0 : 1.0, 0.0),
      end: Offset.zero,
    ).animate(curvedAnimation);

    return SlideTransition(
      position: slideAnimation,
      child: child,
    );
  }
}
