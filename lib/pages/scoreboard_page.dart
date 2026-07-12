import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:esportes_flutter/app_bar/standard_app_bar.dart';
import 'package:esportes_flutter/buttons/secondary_button.dart';
import 'package:esportes_flutter/services/match_service.dart';
import 'package:esportes_flutter/services/routes_service.dart';
import 'package:esportes_flutter/config/string_constants.dart';
import 'package:esportes_flutter/config/app_state.dart';
import 'package:esportes_flutter/dialogs/options_dialog.dart';
import 'package:esportes_flutter/dialogs/simple_dialog.dart';
import 'package:esportes_flutter/theme/ui_color.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({super.key});

  @override
  State<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {
  final MatchService _matchService = MatchService();

  int _period = 1;
  int hours = 0, minutes = 0, seconds = 0, milliseconds = 0;

  int _homeScore = 0, _awayScore = 0;

  String _timerState = TimerState.STOP.value;

  bool isRunning = false;

  Timer timer = Timer.periodic(const Duration(milliseconds: 0), (_) {});

  @override
  void initState() {
    super.initState();
    _changePeriod(currentMatchSettings.value.period);
  }

  Future<void> _showInfoDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const SimpleInfoDialog(
          title: HOW_TO_USE,
          text: SCOREBOARD_INSTRUCTIONS,
        );
      },
    );
  }

  Future<void> _showExitDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OptionsDialog(
          callback: (value) => _handleExitOption(value),
          title: ATTENTION,
          text: EXIT_MATCH_WARNING,
        );
      },
    );
  }

  Future<void> _showResetDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OptionsDialog(
          callback: (value) => _handleResetOption(value),
          title: ATTENTION,
          text: RESET_DESCRIPTION,
        );
      },
    );
  }

  void _handleResetOption(bool isReiniciar) {
    if (!isReiniciar) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      stopTimer();
      currentMatchSettings.value.homeTeam = HOME_TEAM;
      currentMatchSettings.value.awayTeam = AWAY_TEAM;
      currentMatchSettings.value.period = 1;
      currentMatchSettings.value.duration = 25;
      setState(() {
        _homeScore = 0;
        _awayScore = 0;
        _period = 1;
      });
    }
  }

  void _handleExitOption(bool shouldExit) {
    if (shouldExit) {
      Navigator.of(context).pop();
      stopTimer();
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
    }
  }

  void _changePeriod(int period) {
    final int value = _matchService.changePeriod(period);
    setState(() => _period = value);
  }

  void _changeTimerState(String value) {
    setState(() => _timerState = value);
  }

  bool _isStartDisabled() {
    return _timerState == TimerState.START.value ? true : false;
  }

  bool _isPauseDisabled() {
    return _timerState == TimerState.START.value ? false : true;
  }

  bool _isStopDisabled() {
    return _timerState == TimerState.PAUSE.value ? false : true;
  }

  bool _isResetDisabled() {
    if (_homeScore > 0 || _awayScore > 0) return false;
    if (_timerState != TimerState.STOP.value) return false;
    return true;
  }

  void startTimer() {
    if (isRunning) return;

    isRunning = true;
    timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      setState(() {
        milliseconds++;
        if (milliseconds >= 100) {
          milliseconds = 0;
          seconds++;
        }
        if (seconds >= 60) {
          seconds = 0;
          minutes++;
        }
        if (minutes >= 60) {
          minutes = 0;
          hours++;
        }
      });
    });

    _changeTimerState(TimerState.START.value);
  }

  void pauseTimer() {
    timer.cancel();
    setState(() => isRunning = false);
    _changeTimerState(TimerState.PAUSE.value);
  }

  void stopTimer() {
    timer.cancel();
    setState(() {
      hours = 0;
      minutes = 0;
      seconds = 0;
      milliseconds = 0;
      isRunning = false;
    });
    _changeTimerState(TimerState.STOP.value);
  }

  String _formatTwoDigits(int value) {
    return value.toString().padLeft(2, '0');
  }

  String _formatThreeDigits(int value) {
    return value.toString().padLeft(3, '0');
  }

  void _increaseHomeScore() {
    setState(() => _homeScore++);
  }

  void _increaseAwayScore() {
    setState(() => _awayScore++);
  }

  void _decreaseHomeScore() {
    if (_homeScore > 0) {
      setState(() => _homeScore--);
    }
  }

  void _decreaseAwayScore() {
    if (_awayScore > 0) {
      setState(() => _awayScore--);
    }
  }

  @override
  void dispose() {
    timer = Timer.periodic(const Duration(milliseconds: 0), (_) {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final iconSize = width / 6;
    final halfWidth = (width / 2) - 4;
    const spacing = 8.0;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (isRunning || _homeScore > 0 || _awayScore > 0) {
          _showExitDialog();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StandardAppBar(
                callback: () => _showInfoDialog(),
                text: SCOREBOARD_AND_TIMER,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: halfWidth,
                    color: UiColor.display,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        '${_period.toString()}° $TIME',
                        style: const TextStyle(
                          color: UiColor.period,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'display',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: spacing),
                  Container(
                    width: halfWidth,
                    color: UiColor.display,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: timerDisplay(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: spacing),
              Row(
                children: [
                  Container(
                    width: halfWidth,
                    color: UiColor.display,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        currentMatchSettings.value.homeTeam,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: UiColor.homeTeam,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'display',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: spacing),
                  Container(
                    width: halfWidth,
                    color: UiColor.display,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        currentMatchSettings.value.awayTeam,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: UiColor.awayTeam,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'display',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: spacing),
              Row(
                children: [
                  Container(
                    width: halfWidth,
                    color: UiColor.display,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        _homeScore.toString(),
                        style: TextStyle(
                          color: UiColor.homeTeam,
                          fontSize: width * 0.2,
                          fontFamily: 'display',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: spacing),
                  Container(
                    width: halfWidth,
                    color: UiColor.display,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        _awayScore.toString(),
                        style: TextStyle(
                          color: UiColor.awayTeam,
                          fontSize: width * 0.2,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'display',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: spacing),
              Row(
                children: [
                  SecondaryButton(
                    callback: () => _changePeriod(_period),
                    color: UiColor.period,
                    icon: Icons.timer,
                    size: iconSize,
                  ),
                  SecondaryButton(
                    callback: () => startTimer(),
                    color: UiColor.duration,
                    disabled: _isStartDisabled(),
                    icon: Icons.play_arrow,
                    size: iconSize,
                  ),
                  SecondaryButton(
                    callback: () => pauseTimer(),
                    color: UiColor.duration,
                    disabled: _isPauseDisabled(),
                    icon: Icons.pause,
                    size: iconSize,
                  ),
                  SecondaryButton(
                    callback: () => stopTimer(),
                    color: UiColor.duration,
                    disabled: _isStopDisabled(),
                    icon: Icons.stop,
                    size: iconSize,
                  ),
                  SecondaryButton(
                    callback: () => _showResetDialog(),
                    color: UiColor.line,
                    disabled: _isResetDisabled(),
                    icon: Icons.restart_alt,
                    size: iconSize,
                  ),
                  SecondaryButton(
                    callback: () => context.push(AppRoute.MATCH_SETTINGS.value),
                    color: const Color(0xFFFFFFFF),
                    icon: Icons.settings,
                    size: iconSize,
                  ),
                ],
              ),
              const SizedBox(height: spacing),
              Row(
                children: [
                  SecondaryButton(
                    callback: () => _increaseHomeScore(),
                    color: UiColor.homeTeam,
                    doubleWidth: true,
                    icon: Icons.plus_one,
                    size: iconSize,
                  ),
                  SecondaryButton(
                    callback: () => _decreaseHomeScore(),
                    color: UiColor.homeTeam,
                    icon: Icons.remove,
                    size: iconSize,
                  ),
                  SecondaryButton(
                    callback: () => _decreaseAwayScore(),
                    color: UiColor.awayTeam,
                    icon: Icons.remove,
                    size: iconSize,
                  ),
                  SecondaryButton(
                    callback: () => _increaseAwayScore(),
                    color: UiColor.awayTeam,
                    doubleWidth: true,
                    icon: Icons.plus_one,
                    size: iconSize,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget timerDisplay() {
    return Text(
      "${_formatTwoDigits(hours)}:${_formatTwoDigits(minutes)}:${_formatTwoDigits(seconds)}.${_formatThreeDigits(milliseconds)}",
      style: const TextStyle(
        color: UiColor.duration,
        fontSize: 24,
        fontWeight: FontWeight.normal,
        fontFamily: 'display',
      ),
    );
  }
}
