import 'package:flutter/material.dart';
import 'package:esportes_flutter/buttons/icon_button.dart';

class StandardAppBar extends StatefulWidget implements PreferredSizeWidget {
  const StandardAppBar({
    super.key,
    required Function callback,
    required String text,
  })  : _callback = callback,
        _text = text;

  final Function _callback;
  final String _text;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<StandardAppBar> createState() => _StandardAppBarState();
}

class _StandardAppBarState extends State<StandardAppBar> {
  void _goBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppIconButton(
        callback: () => _goBack(),
        icon: Icons.arrow_circle_left_outlined,
      ),
      title: Text(
        widget._text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        AppIconButton(
          callback: () => widget._callback(),
          icon: Icons.help_outline,
        )
      ],
    );
  }
}
