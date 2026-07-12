import 'package:flutter/material.dart';
import 'package:esportes_flutter/app_bar/standard_app_bar.dart';
import 'package:esportes_flutter/buttons/text_button.dart';
import 'package:esportes_flutter/services/team_selection_service.dart';
import 'package:esportes_flutter/config/string_constants.dart';
import 'package:esportes_flutter/dialogs/simple_dialog.dart';
import 'package:esportes_flutter/text/title_medium_text.dart';
import 'package:esportes_flutter/theme/ui_color.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  final TeamSelectionService _teamSelectionService = TeamSelectionService();

  List<List<String>> _teams = [];
  int index = 0;

  @override
  void initState() {
    _splitTeams();
    super.initState();
  }

  void _splitTeams() {
    setState(() => _teams = _teamSelectionService.splitTeams());
  }

  Future<void> _showTeamsDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const SimpleInfoDialog(
          title: HOW_TO_USE,
          text: TEAMS_INSTRUCTIONS,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StandardAppBar(
                callback: () => _showTeamsDialog(),
                text: SELECTED_TEAMS,
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: TitleMediumText(
                  color: UiColor.primary,
                  text: GENERATED_TEAMS,
                ),
              ),
              Wrap(
                children: [
                  for (var item in _teams)
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      color: _teamSelectionService.selectColor(),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var name in item)
                            Text(
                              name.toUpperCase(),
                              style: const TextStyle(
                                color: Color(0xFF0C2D54),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                        ],
                      ),
                    ),
                ],
              ),
              LabelButton(
                color: UiColor.primary,
                callback: () => _splitTeams(),
                text: GENERATE_TEAMS_AGAIN,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
