import 'package:flutter/widgets.dart';
import 'package:esportes_flutter/config/string_constants.dart';
import 'package:esportes_flutter/models/match_settings.dart';

ValueNotifier<List<String>> currentPlayers = ValueNotifier<List<String>>([]);

ValueNotifier<int> currentPlayerCount = ValueNotifier<int>(5);

ValueNotifier<MatchSettings> currentMatchSettings =
    ValueNotifier<MatchSettings>(
  MatchSettings(
    homeTeam: HOME_TEAM,
    awayTeam: AWAY_TEAM,
    duration: 25,
    period: 1,
  ),
);
