import 'package:flutter/material.dart';
import 'package:esportes_flutter/buttons/primary_button.dart';
import 'package:esportes_flutter/text/title_medium_text.dart';

class LabelButton extends StatefulWidget {
  const LabelButton({
    super.key,
    required Function callback,
    required Color color,
    IconData? icon,
    IconData? activeIcon,
    double? size,
    required String text,
  })  : _callback = callback,
        _color = color,
        _icon = icon,
        _activeIcon = activeIcon,
        _size = size,
        _text = text;

  final Function _callback;
  final Color _color;
  final IconData? _icon;
  final IconData? _activeIcon;
  final double? _size;
  final String _text;

  @override
  State<LabelButton> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<LabelButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TitleMediumText(color: widget._color, text: widget._text),
          ),
        ),
        PrimaryButton(
          color: widget._color,
          callback: () => widget._callback(),
          icon: widget._icon,
          activeIcon: widget._activeIcon,
          size: widget._size,
        ),
      ],
    );
  }
}
