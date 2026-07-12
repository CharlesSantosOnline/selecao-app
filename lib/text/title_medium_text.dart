import 'package:flutter/material.dart';

class TitleMediumText extends StatelessWidget {
  const TitleMediumText({
    super.key,
    required Color color,
    required String text,
  })  : _color = color,
        _text = text;

  final Color _color;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        color: _color,
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
