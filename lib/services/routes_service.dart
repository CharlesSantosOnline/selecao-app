import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:esportes_flutter/theme/ui_duration.dart';

CustomTransitionPage transicaoPaginas<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: UiDuration.pageTransition),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: child,
    ),
  );
}

enum AppRoute {
  MATCH_SETTINGS('/match-settings'),
  DONATE('/donation'),
  HOME('/home'),
  SCOREBOARD('/scoreboard'),
  SELECT('/team-selection'),
  TEAMS('/teams');

  final String value;
  const AppRoute(this.value);
}
