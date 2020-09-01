import 'package:flutter/material.dart';
import 'package:verify_code_input/verify_code_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Input Code Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(30, 100, 30, 0),
              child: VerifyCodeInput(
                onValueChanged: (value) {
                  if (value.length < 6) {
                    setState(() {
                      text = "";
                    });
                  }
                },
                onComplete: (value) {
                  setState(() {
                    text = 'Your input code is : $value';
                  });
                },
              )),
          SizedBox(
            height: 25,
          ),
          Text(text),
        ],
      ),
    );
  }
}
