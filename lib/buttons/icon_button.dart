import 'package:flutter/material.dart';
import 'package:esportes_flutter/theme/ui_border.dart';
import 'package:esportes_flutter/theme/ui_size.dart';

class AppIconButton extends StatefulWidget {
  const AppIconButton({
    super.key,
    required Function callback,
    required IconData icon,
  })  : _callback = callback,
        _icon = icon;

  final Function _callback;
  final IconData _icon;

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UiSize.icon,
      height: UiSize.icon,
      child: InkWell(
        borderRadius: BorderRadius.circular(UiBorder.circle),
        child: Icon(widget._icon),
        onTap: () => widget._callback(),
      ),
    );
  }
}
