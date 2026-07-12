import 'package:flutter/material.dart';
import 'package:esportes_flutter/buttons/primary_button.dart';
import 'package:esportes_flutter/text/title_medium_text.dart';
import 'package:esportes_flutter/theme/ui_color.dart';
import 'package:esportes_flutter/theme/ui_size.dart';

class OptionsDialog extends StatefulWidget {
  const OptionsDialog({
    super.key,
    required Function callback,
    IconData? icon,
    IconData? activeIcon,
    required String text,
    required String title,
  })  : _callback = callback,
        _icon = icon,
        _activeIcon = activeIcon,
        _text = text,
        _title = title;

  final Function _callback;
  final IconData? _icon;
  final IconData? _activeIcon;
  final String _text;
  final String _title;

  @override
  State<OptionsDialog> createState() => _OptionsDialogState();
}

class _OptionsDialogState extends State<OptionsDialog> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(
            Icons.warning_amber,
            color: UiColor.primary,
          ),
          const SizedBox(width: 16),
          TitleMediumText(
            text: widget._title,
            color: UiColor.primary,
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
              callback: () => widget._callback(false),
              color: const Color(0xFF0C2D54),
              icon: widget._icon ?? Icons.highlight_off,
              activeIcon: widget._activeIcon ?? Icons.cancel,
              iconColor: UiColor.primary,
              size: UiSize.dialogButton,
            ),
            const SizedBox(width: 16),
            PrimaryButton(
              callback: () => widget._callback(true),
              size: UiSize.dialogButton,
            ),
          ],
        ),
      ],
    );
  }
}
