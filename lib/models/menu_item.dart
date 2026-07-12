import 'package:esportes_flutter/class/routes_class.dart';
import 'package:esportes_flutter/config/string_config.dart';

class MenuModel {
  final String texto;
  final String rota;

  MenuModel({
    required this.texto,
    required this.rota,
  });

  static List<MenuModel> listaMenu = [
    MenuModel(
      rota: RoutesEnum.SELECIONAR.value,
      texto: SELECIONAR,
    ),
    MenuModel(
      rota: RoutesEnum.PLACAR.value,
      texto: PLACAR,
    ),
    MenuModel(
      rota: RoutesEnum.DOAR.value,
      texto: DOAR,
    )
  ];
}
