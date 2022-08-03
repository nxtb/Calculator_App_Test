import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String o = "0";

  String _o = "0";
  double n1 = 0.0;
  double n2 = 0.0;
  String oper = "";

  buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(24.0))),
        child: Text(buttonText,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        onPressed: () {
          if (buttonText == "CLEAR") {
            _o = "0";
            n1 = 0.0;
            n2 = 0.0;
            oper = "";
          } else if (buttonText == "+" ||
              buttonText == "-" ||
              buttonText == "/" ||
              buttonText == "X") {
            n1 = double.parse(o);

            oper = buttonText;

            _o = "0";
          } else if (buttonText == ".") {
            if (_o.contains(".")) {
              print("Already conatains a decimals");
              return;
            } else {
              _o = _o + buttonText;
            }
          } else if (buttonText == "=") {
            n2 = double.parse(o);
            print("!!!!HERE----->");

            if (oper == "+") {
              _o = (n1 + n2).toString();
            }
            if (oper == "-") {
              _o = (n1 - n2).toString();
            }
            if (oper == "X") {
              _o = (n1 * n2).toString();
            }
            if (oper == "/") {
              _o = (n1 / n2).toString();
            }

            n1 = 0.0;
            n2 = 0.0;
            oper = "";
          } else {
            _o = _o + buttonText;
          }

          print(_o);

          setState(() {
            o = double.parse(_o).toStringAsFixed(2);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title!),
          ),
          body: Container(
              child: Column(children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: Text(o,
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
            Expanded(child: Divider()),
            Column(children: [
              Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/")
              ]),
              Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X")
              ]),
              Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ]),
              Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+")
              ]),
              Row(children: [
                buildButton("CLEAR"),
                buildButton("="),
              ])
            ])
          ]))),
    );
  }
}
