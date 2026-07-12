import 'package:esportes_flutter/services/routes_service.dart';
import 'package:esportes_flutter/config/string_constants.dart';

class MenuItem {
  final String text;
  final String route;

  MenuItem({
    required this.text,
    required this.route,
  });

  static List<MenuItem> menuItems = [
    MenuItem(
      route: AppRoute.SELECT.value,
      text: SELECT,
    ),
    MenuItem(
      route: AppRoute.SCOREBOARD.value,
      text: SCOREBOARD,
    ),
    MenuItem(
      route: AppRoute.DONATE.value,
      text: DONATE,
    )
  ];
}
