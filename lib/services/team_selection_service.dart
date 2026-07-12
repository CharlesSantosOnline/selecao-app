import 'dart:math';
import 'package:flutter/material.dart';
import 'package:esportes_flutter/config/app_state.dart';

class TeamSelectionService {
  int index = 0;

  bool validateTeams(int selectedNumber) {
    final int number = selectedNumber;
    final int list = currentPlayers.value.length;

    if (list == 0) return false;
    if (number >= list) return false;
    return true;
  }

  List<List<String>> splitTeams() {
    List<List<String>> teams = [];
    List<String> list = currentPlayers.value;
    final int number = currentPlayerCount.value;

    if (list.length > number) {
      list.shuffle();

      int groupCount = (list.length / number).ceil();

      for (int i = 0; i < groupCount; i++) {
        int startIndex = i * number;
        int endIndex = min(startIndex + number, list.length);

        List<String> group = list.sublist(startIndex, endIndex);
        teams.add(group);
      }
    } else {
      teams.add(list);
    }

    return teams;
  }

  Color selectColor() {
    final colors = [
      const Color(0xffC8F51B),
      const Color(0xffE9FFD9),
      const Color(0xffC8B7F3),
      const Color(0xFFFCD45C),
      const Color(0xFFDA714F),
      const Color(0xFF688DE2),
      const Color(0xFF1CF559),
    ];

    final color = colors[index];
    index = (index + 1) % colors.length;
    return color;
  }
}
