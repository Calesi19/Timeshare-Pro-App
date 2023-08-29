import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";

  void _onDigitPressed(String digit) {
    setState(() {
      if (_output == "0") {
        _output = digit;
      } else {
        _output += digit;
      }
    });
  }

  double _evaluateExpression(String expression) {
    // Convert the equation to a format suitable for parsing
    String finalExpression =
        expression.replaceAll('×', '*').replaceAll('÷', '/');

    // Parse and evaluate the expression
    Parser p = Parser();
    Expression exp = p.parse(finalExpression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    return eval;
  }

  void _onClearPressed() {
    setState(() {
      _output = "0";
    });
  }

  void _onOperationPressed(String newOperation) {
    if (newOperation == "=") {
      try {
        _output = _evaluateExpression(_output).toString();
      } catch (e) {
        _output = "Error";
      }
    } else if (newOperation == "⌫") {
      if (_output.isNotEmpty) {
        _output = _output.substring(0, _output.length - 1);
        if (_output.isEmpty) {
          _output = "0";
        }
      }
    } else {
      _output += newOperation;
    }
    setState(() {});
  }

  Widget _buildButton(String buttonText, Function onPressed, {int flex = 1}) {

    // If button text is for operation, return a button with a different style

    if (buttonText == "÷" || buttonText == "×" || buttonText == "-" || buttonText == "+" || buttonText == "=") {
      return Expanded(
        flex: flex,
        child: ElevatedButton(
          onPressed: () => onPressed(buttonText),
          child: Text(buttonText, style: TextStyle(fontSize: 20.0, color: Colors.black)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(24.0),
          ),
        ),
      );
    }

    return Expanded(
    flex: flex,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => onPressed(buttonText),
        child: Text(buttonText, style: TextStyle(fontSize: 20.0, color: Colors.black)),
        style: ElevatedButton.styleFrom(
          backgroundColor: (buttonText == "C" || buttonText == "⌫") ? Colors.grey[300] : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.all(24.0),
        ),
      ),
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16.0),
              child: Text(
                _output,
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(children: [
                _buildButton("C", _onClearPressed, flex: 2),
                _buildButton("⌫", _onOperationPressed, flex: 1),
                _buildButton("÷", _onOperationPressed, flex: 1),
              ]),
              Row(children: [
                _buildButton("7", _onDigitPressed),
                _buildButton("8", _onDigitPressed),
                _buildButton("9", _onDigitPressed),
                _buildButton("×", _onOperationPressed),
                
              ]),
              Row(children: [
                _buildButton("4", _onDigitPressed),
                _buildButton("5", _onDigitPressed),
                _buildButton("6", _onDigitPressed),
                _buildButton("-", _onOperationPressed),
                
              ]),
              Row(
                children: [
                _buildButton("1", _onDigitPressed),
                _buildButton("2", _onDigitPressed),
                _buildButton("3", _onDigitPressed),
                _buildButton("+", _onOperationPressed),
                
              ]),
              Row(children: [
                _buildButton("0", _onDigitPressed, flex: 2),
                _buildButton(".", _onDigitPressed, flex: 1),
                _buildButton("=", _onOperationPressed, flex: 1),
                
              ]),
              
              SizedBox(height: 100.0)
            ],
          )
        ],
      ),
    );
  }
}
