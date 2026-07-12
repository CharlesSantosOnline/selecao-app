import 'package:flutter/material.dart';
import 'package:esportes_flutter/app_bar/standard_app_bar.dart';
import 'package:esportes_flutter/buttons/number_button.dart';
import 'package:esportes_flutter/buttons/primary_button.dart';
import 'package:esportes_flutter/services/options_service.dart';
import 'package:esportes_flutter/config/string_constants.dart';
import 'package:esportes_flutter/config/app_state.dart';
import 'package:esportes_flutter/dialogs/simple_dialog.dart';
import 'package:esportes_flutter/inputs/text_input.dart';
import 'package:esportes_flutter/models/match_settings.dart';
import 'package:esportes_flutter/text/title_medium_text.dart';
import 'package:esportes_flutter/theme/ui_color.dart';

class MatchSettingsPage extends StatefulWidget {
  const MatchSettingsPage({super.key});

  @override
  State<MatchSettingsPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<MatchSettingsPage> {
  final OptionsService _optionsService = OptionsService();

  String _homeTeam = currentMatchSettings.value.homeTeam;
  String _awayTeam = currentMatchSettings.value.awayTeam;
  int _period = currentMatchSettings.value.period;
  int _timerState = currentMatchSettings.value.duration;

  Future<void> _showInfoDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const SimpleInfoDialog(
          title: HOW_TO_USE,
          text: SET_MATCH_INSTRUCTIONS,
        );
      },
    );
  }

  void _saveMatchSettings() {
    MatchSettings matchSettings = MatchSettings(
      homeTeam: _homeTeam,
      awayTeam: _awayTeam,
      duration: _timerState,
      period: _period,
    );

    currentMatchSettings.value = matchSettings;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StandardAppBar(
              callback: () => _showInfoDialog(),
              text: SET_MATCH,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TitleMediumText(
                color: UiColor.homeTeam,
                text: HOME_TEAM_LABEL,
              ),
            ),
            AppTextInput(
              callback: (value) => _homeTeam = value,
              controller: TextEditingController(
                  text: currentMatchSettings.value.homeTeam),
              color: UiColor.homeTeam,
              hint: HOME_TEAM,
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: TitleMediumText(
                color: UiColor.awayTeam,
                text: AWAY_TEAM_LABEL,
              ),
            ),
            AppTextInput(
              callback: (value) => _awayTeam = value,
              controller: TextEditingController(
                  text: currentMatchSettings.value.awayTeam),
              color: UiColor.awayTeam,
              hint: AWAY_TEAM,
            ),
            NumberButton(
              callback: (value) => _period = value,
              color: UiColor.period,
              initialValue: currentMatchSettings.value.period,
              list: _optionsService.periodCountOptions,
              text: SELECT_PERIOD_COUNT,
            ),
            NumberButton(
              callback: (value) => _timerState = value,
              color: UiColor.duration,
              initialValue: currentMatchSettings.value.duration,
              list: _optionsService.periodDurationOptions,
              text: TIME_SELECT,
            ),
            PrimaryButton(
              callback: () => _saveMatchSettings(),
              full: true,
            ),
          ],
        ),
      ),
    );
  }
}
