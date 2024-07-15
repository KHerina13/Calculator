import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  String equation = '';
  String result = '';

  void addToEquation(String sign, bool canFirst, BuildContext context) {
    if (equation.isEmpty) {
      if (sign == '.') {
        equation = '0.';
      } else if (canFirst) {
        equation = sign;
      }
    } else {
      if (sign == "AC") {
        equation = '';
        result = '';
      } else if (sign == "⌫") {
        if (equation.endsWith(' ')) {
          equation = equation.substring(0, equation.length - 3);
        } else {
          equation = equation.substring(0, equation.length - 1);
        }
      } else if (equation.endsWith('.') && sign == '.') {
        return;
      } else if (equation.endsWith(' ') && sign == '.') {
        equation += '0.';
      } else if (equation.endsWith(' ') && !canFirst) {
        equation = equation.substring(0, equation.length - 3) + sign;
      } else if (sign == '=') {
        // Uncomment and implement history saving if needed
        // final historyItem = HistoryItem()
        //   ..title = result
        //   ..subtitle = equation;
        // Hive.box<HistoryItem>('history').add(historyItem);
        // showToast(context, 'Saved');
      } else {
        equation += sign;
      }
    }

    if (equation == '0') {
      equation = '';
    }

    try {
      var privateResult = equation.replaceAll('÷', '/').replaceAll('×', '*');
      Parser p = Parser();
      Expression exp = p.parse(privateResult);
      ContextModel cm = ContextModel();
      result = exp.evaluate(EvaluationType.REAL, cm).toString();
      if (result.endsWith('.0')) {
        result = result.substring(0, result.length - 2);
      }
    } catch (e) {
      result = '';
    }

    notifyListeners();
  }
}
