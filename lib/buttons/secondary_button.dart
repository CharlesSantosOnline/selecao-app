import 'package:flutter/material.dart';

class SecondaryButton extends StatefulWidget {
  const SecondaryButton({
    super.key,
    required Function callback,
    required Color color,
    bool? disabled,
    bool? doubleWidth,
    IconData? icon,
    required double size,
  })  : _callback = callback,
        _disabled = disabled,
        _color = color,
        _doubleWidth = doubleWidth,
        _icon = icon,
        _size = size;

  final Function _callback;
  final Color _color;
  final bool? _disabled;
  final bool? _doubleWidth;
  final IconData? _icon;
  final double _size;

  @override
  State<SecondaryButton> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<SecondaryButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: () => widget._disabled == true ? null : widget._callback(),
      child: Container(
        width: widget._doubleWidth == true ? (widget._size * 2) : widget._size,
        height: widget._size,
        color: widget._disabled ?? isPressed
            ? widget._color.withValues(alpha: 0.7)
            : widget._color,
        child: Center(
          child: Icon(
            widget._icon,
            size: widget._size * 0.5,
            color: const Color(0xFF0C2D54),
          ),
        ),
      ),
    );
  }
}
