import 'package:flutter/material.dart';
import 'package:esportes_flutter/theme/ui_color.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required Function callback,
    Color? color,
    bool? full,
    IconData? icon,
    IconData? activeIcon,
    Color? iconColor,
    double? size,
  })  : _callback = callback,
        _color = color,
        _full = full,
        _icon = icon,
        _activeIcon = activeIcon,
        _iconColor = iconColor,
        _size = size;

  final Function _callback;
  final Color? _color;
  final bool? _full;
  final IconData? _icon;
  final IconData? _activeIcon;
  final Color? _iconColor;
  final double? _size;

  @override
  State<PrimaryButton> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<PrimaryButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final size = width / 5;

    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: () => widget._callback(),
      child: Row(
        children: [
          if (widget._full == true) Expanded(child: Container()),
          Container(
            width: widget._size ?? size,
            height: widget._size ?? size,
            color: isPressed
                ? widget._color?.withValues(alpha: 0.7) ??
                    UiColor.primary.withValues(alpha: 0.7)
                : widget._color ?? UiColor.primary,
            child: Center(
              child: Icon(
                isPressed
                    ? widget._activeIcon ?? Icons.arrow_circle_right
                    : widget._icon ?? Icons.arrow_circle_right_outlined,
                size: (widget._size ?? size) * 0.7,
                color: widget._iconColor ?? const Color(0xFF0C2D54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
