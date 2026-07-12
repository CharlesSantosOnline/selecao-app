import 'package:flutter/material.dart';
import 'package:esportes_flutter/theme/ui_border.dart';
import 'package:esportes_flutter/theme/ui_color.dart';

class AppTextInput extends StatefulWidget {
  const AppTextInput({
    super.key,
    required Function callback,
    TextEditingController? controller,
    required Color color,
    required String hint,
  })  : _callback = callback,
        _controller = controller,
        _color = color,
        _hint = hint;

  final Function _callback;
  final TextEditingController? _controller;
  final Color _color;
  final String _hint;

  @override
  State<AppTextInput> createState() => _PlayersInputState();
}

class _PlayersInputState extends State<AppTextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: widget._color,
      child: TextFormField(
        autofocus: false,
        controller: widget._controller,
        onChanged: (value) => setState(() => widget._callback(value)),
        maxLines: 1,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(
          color: UiColor.hint,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: widget._hint,
          filled: true,
          fillColor: widget._color,
          hintStyle: const TextStyle(
            color: UiColor.hint,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: UiBorder.inputBorder,
          enabledBorder: UiBorder.inputBorder,
          focusedBorder: UiBorder.inputBorder,
        ),
      ),
    );
  }
}
