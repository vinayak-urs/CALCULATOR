import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'calculator'),
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
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonpresed(String buttontext) {
    if (buttontext == "CLEAR") {
      output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      _output = "0";
    } else if (buttontext == "+" ||
        buttontext == "-" ||
        buttontext == "x" ||
        buttontext == "/") {
      num1 = double.parse(output);
      operand = buttontext;
      _output = "0";
    } else if (buttontext == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimals");
        return;
      } else {
        _output = _output + buttontext;
      }
    } else if (buttontext == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttontext;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildbutton(String buttontext) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(20.0),
        child: new Text(
          buttontext,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => {buttonpresed(buttontext)},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  padding:
                      EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                  child: Text(_output,
                      style: TextStyle(
                          fontSize: 48.0, fontWeight: FontWeight.bold))),
              Expanded(
                child: Divider(),
              ),
              Row(children: [
                buildbutton("7"),
                buildbutton("8"),
                buildbutton("9"),
                buildbutton("/")
              ]),
              Row(children: [
                buildbutton("4"),
                buildbutton("5"),
                buildbutton("6"),
                buildbutton("x")
              ]),
              Row(children: [
                buildbutton("1"),
                buildbutton("2"),
                buildbutton("3"),
                buildbutton("-")
              ]),
              Row(children: [
                buildbutton("."),
                buildbutton("0"),
                buildbutton("00"),
                buildbutton("+")
              ]),
              Row(children: [buildbutton("CLEAR"), buildbutton("=")])
            ],
          ),
        ));
  }
}
