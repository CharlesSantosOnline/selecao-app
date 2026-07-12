import 'package:esportes_flutter/config/app_state.dart';

class MatchService {
  int changePeriod(int atual) {
    int period = currentMatchSettings.value.period;

    if (atual < period) {
      atual++;
    } else {
      atual = 1;
    }

    return atual;
  }
}

enum TimerState {
  START('inicio'),
  STOP('parar'),
  PAUSE('pausar');

  final String value;
  const TimerState(this.value);
}
