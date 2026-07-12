import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esportes_flutter/appbar/voltar_appbar.dart';
import 'package:esportes_flutter/button/texto_button.dart';
import 'package:esportes_flutter/config/string_config.dart';
import 'package:esportes_flutter/theme/ui_cor.dart';
import 'package:esportes_flutter/theme/ui_tamanho.dart';

class DoarPage extends StatefulWidget {
  const DoarPage({super.key});

  @override
  State<DoarPage> createState() => _DoarPageState();
}

class _DoarPageState extends State<DoarPage> {
  void _copiarPix(BuildContext context) {
    Clipboard.setData(const ClipboardData(text: PIX_CODIGO));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VoltarAppbar(texto: DOAR),
            Container(
              color: UiCor.fundo,
              padding: const EdgeInsets.all(16),
              child: const Text(
                DOAR_DESCRICAO,
                style: TextStyle(
                  color: UiCor.principal,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            TextoButton(
              callback: () => _copiarPix(context),
              cor: UiCor.principal,
              icone: Icons.content_copy,
              iconeAtivo: Icons.file_copy,
              size: UiTamanho.botaoDialog,
              texto: PIX_COPIAR,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
