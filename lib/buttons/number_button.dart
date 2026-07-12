import 'package:flutter/material.dart';
import 'package:esportes_flutter/text/title_medium_text.dart';
import 'package:esportes_flutter/theme/ui_color.dart';

class NumberButton extends StatefulWidget {
  const NumberButton({
    super.key,
    required Function callback,
    required Color color,
    required int initialValue,
    required List<int> list,
    required String text,
  })  : _callback = callback,
        _color = color,
        _initialValue = initialValue,
        _list = list,
        _text = text;

  final Function _callback;
  final Color _color;
  final int _initialValue;
  final List<int> _list;
  final String _text;

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  int? selectedNumber;

  @override
  void initState() {
    super.initState();
    _selectNumber(widget._initialValue);
  }

  void _selectNumber(int number) {
    setState(() => selectedNumber = number);
    widget._callback(selectedNumber);
  }

  bool _isSelectedNumber(int number) {
    return selectedNumber == number;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final sizeWidth = width / 7;
    final fontSize = sizeWidth * 0.3;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TitleMediumText(
            color: widget._color,
            text: widget._text,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              for (var item in widget._list)
                GestureDetector(
                  onTap: () => _selectNumber(item),
                  child: Container(
                    color: _isSelectedNumber(item)
                        ? widget._color.withValues(alpha: 0.7)
                        : widget._color,
                    width: sizeWidth,
                    height: sizeWidth,
                    child: Center(
                      child: Text(
                        item.toString(),
                        style: TextStyle(
                          color: UiColor.background,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
