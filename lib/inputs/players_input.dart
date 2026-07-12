import 'package:flutter/material.dart';
import 'package:esportes_flutter/buttons/primary_button.dart';
import 'package:esportes_flutter/config/string_constants.dart';
import 'package:esportes_flutter/text/title_medium_text.dart';
import 'package:esportes_flutter/theme/ui_border.dart';
import 'package:esportes_flutter/theme/ui_color.dart';

class PlayersInput extends StatefulWidget {
  const PlayersInput({
    super.key,
    required Function callback,
  }) : _callback = callback;

  final Function _callback;

  @override
  State<PlayersInput> createState() => _PlayersInputState();
}

class _PlayersInputState extends State<PlayersInput> {
  final TextEditingController _playersController = TextEditingController();

  String _inputText = "";

  final List<String> _players = [];

  void _splitByComma() {
    if (_inputText.isNotEmpty) {
      if (_inputText.contains(',')) {
        List<String> players = _inputText.split(',');

        players = players
            .map((player) => player.trim())
            .where((player) => player.isNotEmpty)
            .toList();

        setState(() => _players.addAll(players));
      } else {
        String player = _inputText.trim();
        if (player.isNotEmpty) {
          setState(() => _players.add(player));
        }
      }
    }

    widget._callback(_players);
    _playersController.clear();
    _inputText = "";
  }

  void _deletePlayer(String player) {
    setState(() => _players.remove(player));
  }

  @override
  void dispose() {
    _playersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleMediumText(
                color: UiColor.player,
                text: ENTER_PLAYER_NAMES,
              ),
              if (_players.isNotEmpty)
                TitleMediumText(
                  text:
                      '${_players.length} ${_players.length > 1 ? NAMES : NAME}',
                  color: UiColor.player,
                ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: UiColor.player,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: _players.isEmpty
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.all(8),
                child: Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  children: [
                    for (var item in _players)
                      GestureDetector(
                        onTap: () => _deletePlayer(item),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(8, 8, 6, 8),
                          color: UiColor.tag,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item.toUpperCase(),
                                style: const TextStyle(
                                  color: UiColor.player,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.close,
                                color: UiColor.player,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      autofocus: false,
                      controller: _playersController,
                      onChanged: (value) => setState(() => _inputText = value),
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.top,
                      style: const TextStyle(
                        color: UiColor.hint,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        hintText: ENTER_NAMES_HINT,
                        filled: true,
                        fillColor: UiColor.player,
                        hintStyle: const TextStyle(
                          color: UiColor.hint,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        border: UiBorder.inputBorder,
                        enabledBorder: UiBorder.inputBorder,
                        focusedBorder: UiBorder.inputBorder,
                      ),
                    ),
                  ),
                  PrimaryButton(
                    color: UiColor.player,
                    callback: () => _splitByComma(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
