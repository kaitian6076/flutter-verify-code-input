import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input_code_row_widget.dart';

typedef OnValueChanged = void Function(String value);
typedef OnComplete = void Function(String value);

class VerifyCodeInput extends StatefulWidget {
  final OnValueChanged onValueChanged;
  final OnComplete onComplete;

  VerifyCodeInput({this.onValueChanged, this.onComplete});

  @override
  _VerifyCodeInputState createState() => _VerifyCodeInputState();
}

class _VerifyCodeInputState extends State<VerifyCodeInput> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  String _inputCode = "";
  int _temp = 0;

  @override
  void initState() {
    super.initState();
    _controller.text = "";
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      // auto focus
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          // The widget that the verification code display
          InputRowWidget(
            inputCode: _inputCode,
          ),
          Opacity(
            opacity: 0.0,
            child: TextField(
              style: TextStyle(color: Colors.transparent, fontSize: 0),
              // only digits
              inputFormatters: [WhitelistingTextInputFormatter(RegExp(r"[0-9]"))],
              keyboardType: TextInputType.number,
              focusNode: _focusNode,
              controller: _controller,
              maxLength: 6,
              onChanged: (String value) {
                _inputCode = _controller.text;

                if (widget.onValueChanged != null) {
                  widget.onValueChanged(_inputCode);
                }

                if (_inputCode.length < 6) {
                  _temp = 0;
                } else if (_inputCode.length == 6) {
                  // dismiss the keyboard
                  _focusNode.unfocus();
                  _temp++;
                  if (_temp == 1) {
                    // print('verificationCode---' + _inputCode);

                    if (widget.onComplete != null) {
                      widget.onComplete(_inputCode);
                    }
                  }
                }

                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }
}
