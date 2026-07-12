import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:esportes_flutter/models/menu_item.dart';
import 'package:esportes_flutter/theme/ui_color.dart';

class MenuItemWidget extends StatefulWidget {
  const MenuItemWidget({
    super.key,
    required MenuItem item,
  }) : _menuItem = item;

  final MenuItem _menuItem;

  @override
  State<MenuItemWidget> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: () => context.push(widget._menuItem.route),
      child: Row(
        children: [
          Text(
            widget._menuItem.text,
            style: const TextStyle(
              color: UiColor.primary,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          Icon(
            isPressed
                ? Icons.arrow_circle_right
                : Icons.arrow_circle_right_outlined,
            size: 48,
            color: UiColor.primary,
          ),
        ],
      ),
    );
  }
}
