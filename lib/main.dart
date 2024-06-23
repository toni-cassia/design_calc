import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatelessWidget {
  // Define button colors
  final Color normalButtonColor = Colors.white;
  final Color calculationButtonColor = Colors.lightBlue[100]!;
  final Color specialButtonColor = Colors.lightBlue[200]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '0',
                        style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 50,
                      height: 5,
                      color: Colors.grey,
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Buttons area
          Expanded(
            flex: 2,
            child: Column(
              children: [
                buildSpecialButtonRow(['√', 'π', '^', '!', 'ˇ']),
                buildButtonRow(['AC', '( )', '%', '÷']),
                buildButtonRow(['7', '8', '9', '×']),
                buildButtonRow(['4', '5', '6', '-']),
                buildButtonRow(['1', '2', '3', '+']),
                buildButtonRow(['0', '.', '⌫', '=']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSpecialButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons.map((button) => buildTextButton(button)).toList(),
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((button) => buildButton(button)).toList(),
      ),
    );
  }

  Widget buildTextButton(String text) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }

  Widget buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: getButtonColor(text),
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Color getButtonColor(String text) {
    if (text == 'AC' || text == '=') {
      return specialButtonColor;
    } else if (text == '( )' ||text == '÷' || text == '×' || text == '-' || text == '+' || text == '%') {
      return calculationButtonColor;
    } else {
      return normalButtonColor;
    }
  }
}