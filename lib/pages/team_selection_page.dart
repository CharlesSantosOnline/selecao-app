import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:esportes_flutter/app_bar/standard_app_bar.dart';
import 'package:esportes_flutter/buttons/number_button.dart';
import 'package:esportes_flutter/buttons/primary_button.dart';
import 'package:esportes_flutter/services/options_service.dart';
import 'package:esportes_flutter/services/routes_service.dart';
import 'package:esportes_flutter/services/team_selection_service.dart';
import 'package:esportes_flutter/config/string_constants.dart';
import 'package:esportes_flutter/config/app_state.dart';
import 'package:esportes_flutter/dialogs/simple_dialog.dart';
import 'package:esportes_flutter/inputs/players_input.dart';
import 'package:esportes_flutter/theme/ui_color.dart';

class TeamSelectionPage extends StatefulWidget {
  const TeamSelectionPage({super.key});

  @override
  State<TeamSelectionPage> createState() => _TeamSelectionPageState();
}

class _TeamSelectionPageState extends State<TeamSelectionPage> {
  final OptionsService _optionsService = OptionsService();
  final TeamSelectionService _teamSelectionService = TeamSelectionService();

  void _selectNumber(int number) {
    currentPlayerCount.value = number;
  }

  void _validateTeams() {
    _teamSelectionService.validateTeams(currentPlayerCount.value)
        ? context.push(AppRoute.TEAMS.value)
        : _showNumberErrorDialog();
  }

  Future<void> _showNumberErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const SimpleInfoDialog(
          title: PLAYER_COUNT_ERROR,
          text: PLAYER_COUNT_ERROR_DESCRIPTION,
        );
      },
    );
  }

  Future<void> _showInfoDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const SimpleInfoDialog(
          title: HOW_TO_USE,
          text: TEAM_SELECTION_INSTRUCTIONS,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              StandardAppBar(
                callback: () => _showInfoDialog(),
                text: SELECT_TEAMS,
              ),
              PlayersInput(callback: (value) => currentPlayers.value = value),
              NumberButton(
                callback: (value) => _selectNumber(value),
                color: UiColor.number,
                initialValue: currentPlayerCount.value,
                list: _optionsService.playerCountOptions,
                text: SELECT_PLAYER_COUNT,
              ),
              PrimaryButton(
                color: UiColor.primary,
                callback: () => _validateTeams(),
                full: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
