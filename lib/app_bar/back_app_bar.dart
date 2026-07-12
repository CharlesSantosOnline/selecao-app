import 'package:flutter/material.dart';
import 'package:esportes_flutter/buttons/icon_button.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const BackAppBar({
    super.key,
    required String text,
  }) : _text = text;

  final String _text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppIconButton(
        callback: () => Navigator.of(context).pop(),
        icon: Icons.arrow_circle_left_outlined,
      ),
      title: Text(
        _text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
