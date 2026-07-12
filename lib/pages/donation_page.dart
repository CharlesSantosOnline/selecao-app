import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esportes_flutter/app_bar/back_app_bar.dart';
import 'package:esportes_flutter/buttons/text_button.dart';
import 'package:esportes_flutter/config/string_constants.dart';
import 'package:esportes_flutter/theme/ui_color.dart';
import 'package:esportes_flutter/theme/ui_size.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  void _copyPixKey(BuildContext context) {
    Clipboard.setData(const ClipboardData(text: PIX_KEY));
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
              const BackAppBar(text: DONATE),
              Container(
                color: UiColor.background,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  DONATION_DESCRIPTION,
                  style: TextStyle(
                    color: UiColor.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              LabelButton(
                callback: () => _copyPixKey(context),
                color: UiColor.primary,
                icon: Icons.content_copy,
                activeIcon: Icons.file_copy,
                size: UiSize.dialogButton,
                text: COPY_PIX_KEY,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
