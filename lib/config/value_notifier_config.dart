import 'package:flutter/widgets.dart';
import 'package:esportes_flutter/config/string_config.dart';
import 'package:esportes_flutter/model/definir_model.dart';

ValueNotifier<List<String>> currentJogadores = ValueNotifier<List<String>>([]);

ValueNotifier<int> currentQuantidade = ValueNotifier<int>(5);

ValueNotifier<DefinirModel> currentDefinir = ValueNotifier<DefinirModel>(
  DefinirModel(
    mandante: MANDANTE,
    visitante: VISITANTE,
    tempo: 25,
    periodo: 1,
  ),
);
