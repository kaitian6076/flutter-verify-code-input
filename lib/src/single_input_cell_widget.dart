import 'package:flutter/material.dart';
import 'custom_cursor_widget.dart';

class SingleCellWidget extends StatefulWidget {
  final String text;
  final bool isFocusedUnderline;
  final bool isShowCursor;

  SingleCellWidget({
    this.text = "",
    this.isFocusedUnderline = false,
    this.isShowCursor = false,
  });

  @override
  State<StatefulWidget> createState() => _SingleCellWidgetState();
}

class _SingleCellWidgetState extends State<SingleCellWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            width: 40,
            height: 45,
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                  color: widget.isFocusedUnderline ? Color(0xff00A0FF) : Color(0xffDDDDDD),
                  width: 2),
            )),
            child: Center(
              child: Text(
                widget.text.toString(),
                style: TextStyle(fontSize: 18),
              ),
            )),
        widget.isShowCursor ? CustomCursorWidget() : Container()
      ],
    );
  }
}
