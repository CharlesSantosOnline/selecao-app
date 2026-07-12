import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:esportes_flutter/appbar/padrao_appbar.dart';
import 'package:esportes_flutter/button/numero_button.dart';
import 'package:esportes_flutter/button/primeiro_button.dart';
import 'package:esportes_flutter/class/lista_class.dart';
import 'package:esportes_flutter/class/routes_class.dart';
import 'package:esportes_flutter/class/selecionar_class.dart';
import 'package:esportes_flutter/config/string_config.dart';
import 'package:esportes_flutter/config/value_notifier_config.dart';
import 'package:esportes_flutter/dialog/simples_dialog.dart';
import 'package:esportes_flutter/input/jogadores_input.dart';
import 'package:esportes_flutter/theme/ui_cor.dart';

class SelecionarPage extends StatefulWidget {
  const SelecionarPage({super.key});

  @override
  State<SelecionarPage> createState() => _SelecionarPageState();
}

class _SelecionarPageState extends State<SelecionarPage> {
  final ListaClass _listaClass = ListaClass();
  final SelecionarClass _selecionarClass = SelecionarClass();

  void _selecionarNumero(int numero) {
    currentQuantidade.value = numero;
  }

  void _validarTimes() {
    _selecionarClass.validarTimes(currentQuantidade.value)
        ? context.push(RoutesEnum.EQUIPES.value)
        : _dialogErroNumero();
  }

  Future<void> _dialogErroNumero() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const SimplesDialog(
          titulo: SELECIONAR_NUMERO_ERRO,
          texto: SELECIONAR_NUMERO_ERRO_DESCRICAO,
        );
      },
    );
  }

  Future<void> _dialogInfo() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const SimplesDialog(
          titulo: COMO_USAR,
          texto: SELECIONAR_INSTRUCAO,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            PadraoAppbar(
              callback: () => _dialogInfo(),
              texto: SELECIONAR_EQUIPES,
            ),
            JogadoresInput(callback: (value) => currentJogadores.value = value),
            NumeroButton(
              callback: (value) => _selecionarNumero(value),
              cor: UiCor.numero,
              inicial: currentQuantidade.value,
              lista: _listaClass.listaQtdDeJogadores,
              texto: SELECIONAR_NUMERO,
            ),
            PrimeiroButton(
              cor: UiCor.principal,
              callback: () => _validarTimes(),
              full: true,
            ),
          ],
        ),
      ),
    );
  }
}
