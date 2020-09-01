import 'package:flutter/material.dart';
import 'single_input_cell_widget.dart';

class InputRowWidget extends StatefulWidget {
  final String inputCode;

  InputRowWidget({this.inputCode = ""});

  @override
  _InputRowWidgetState createState() => _InputRowWidgetState();
}

class _InputRowWidgetState extends State<InputRowWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _cells = List();
    String _text;
    bool _isFocusedUnderline;
    bool _isShowCursor;

    for (int i = 0; i < 6; i++) {
      // the display text
      if (i < widget.inputCode.length) {
        _text = widget.inputCode.substring(i, i + 1);
        _isFocusedUnderline = true;
      } else {
        _text = "";
        _isFocusedUnderline = false;
      }

      // whether to show cursor
      if (i == widget.inputCode.length) {
        _isShowCursor = true;
      } else {
        _isShowCursor = false;
      }

      _cells.add(SingleCellWidget(
        text: _text,
        isFocusedUnderline: _isFocusedUnderline,
        isShowCursor: _isShowCursor,
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _cells,
    );
  }
}
