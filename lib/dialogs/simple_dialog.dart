import 'package:flutter/material.dart';
import 'package:esportes_flutter/buttons/primary_button.dart';
import 'package:esportes_flutter/text/title_medium_text.dart';
import 'package:esportes_flutter/theme/ui_color.dart';
import 'package:esportes_flutter/theme/ui_size.dart';

class SimpleInfoDialog extends StatefulWidget {
  const SimpleInfoDialog({
    super.key,
    IconData? icon,
    IconData? activeIcon,
    required String text,
    required String title,
  })  : _icon = icon,
        _activeIcon = activeIcon,
        _text = text,
        _title = title;

  final IconData? _icon;
  final IconData? _activeIcon;
  final String _text;
  final String _title;

  @override
  State<SimpleInfoDialog> createState() => _OptionsDialogState();
}

class _OptionsDialogState extends State<SimpleInfoDialog> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(
            Icons.help_outline,
            color: UiColor.primary,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TitleMediumText(
              text: widget._title,
              color: UiColor.primary,
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(
              widget._text,
              style: const TextStyle(
                color: UiColor.primary,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PrimaryButton(
              color: UiColor.primary,
              callback: () => Navigator.of(context).pop(),
              icon: widget._icon ?? Icons.highlight_off,
              activeIcon: widget._activeIcon ?? Icons.cancel,
              size: UiSize.dialogButton,
            ),
          ],
        ),
      ],
    );
  }
}
