import 'package:go_router/go_router.dart';
import 'package:esportes_flutter/services/routes_service.dart';
import 'package:esportes_flutter/pages/match_settings_page.dart';
import 'package:esportes_flutter/pages/donation_page.dart';
import 'package:esportes_flutter/pages/home_page.dart';
import 'package:esportes_flutter/pages/scoreboard_page.dart';
import 'package:esportes_flutter/pages/team_selection_page.dart';
import 'package:esportes_flutter/pages/teams_page.dart';

final GoRouter routes = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: AppRoute.HOME.value,
  routes: [
    GoRoute(
      path: AppRoute.MATCH_SETTINGS.value,
      pageBuilder: (context, state) => transicaoPaginas(
        context: context,
        state: state,
        child: const MatchSettingsPage(),
      ),
    ),
    GoRoute(
      path: AppRoute.DONATE.value,
      pageBuilder: (context, state) => transicaoPaginas(
        context: context,
        state: state,
        child: const DonationPage(),
      ),
    ),
    GoRoute(
      path: AppRoute.HOME.value,
      pageBuilder: (context, state) => transicaoPaginas(
        context: context,
        state: state,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: AppRoute.SCOREBOARD.value,
      pageBuilder: (context, state) => transicaoPaginas(
        context: context,
        state: state,
        child: const ScoreboardPage(),
      ),
    ),
    GoRoute(
      path: AppRoute.SELECT.value,
      pageBuilder: (context, state) => transicaoPaginas(
        context: context,
        state: state,
        child: const TeamSelectionPage(),
      ),
    ),
    GoRoute(
      path: AppRoute.TEAMS.value,
      pageBuilder: (context, state) => transicaoPaginas(
        context: context,
        state: state,
        child: const TeamsPage(),
      ),
    ),
  ],
);
