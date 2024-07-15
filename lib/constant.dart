import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/CalculatorProvider.dart';

const buttonsBackgroundColor = Color(0xff1a1a1a);
const backgroundColor = Color(0xff323232);
const greenColor = Color(0xff76a51b);
const whiteColor = Color(0xffdbdbdb);

class CalculatorButton extends StatelessWidget {
  final String label;
  final bool isColored;
  final bool isEqualSign;
  final bool canBeFirst;

  const CalculatorButton(
      this.label, {
        this.isColored = false,
        this.isEqualSign = false,
        this.canBeFirst = true,
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context, listen: false);
    final TextStyle? textStyle = Theme.of(context).textTheme.headlineLarge;

    return Material(
      color: isEqualSign
          ? greenColor
          : isColored
          ? backgroundColor
          : buttonsBackgroundColor,
      shape: const CircleBorder(),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () {
          calculatorProvider.addToEquation(label, canBeFirst, context);
        },
        child: Center(
          child: Text(
            label,
            style: textStyle?.copyWith(color: whiteColor, fontSize: 30),
          ),
        ),
      ),
    );
  }
}

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 400),
    ),
  );
}

List<CalculatorButton> buttons = <CalculatorButton>[
  const CalculatorButton('AC', isColored: true, canBeFirst: false),
  const CalculatorButton('⌫', isColored: true, canBeFirst: false),
  const CalculatorButton('%', isColored: true, canBeFirst: false),
  const CalculatorButton(' ÷ ', isColored: true, canBeFirst: false),
  const CalculatorButton('7'),
  const CalculatorButton('8'),
  const CalculatorButton('9'),
  const CalculatorButton(' × ', isColored: true, canBeFirst: false),
  const CalculatorButton('4'),
  const CalculatorButton('5'),
  const CalculatorButton('6'),
  const CalculatorButton(' - ', isColored: true, canBeFirst: false),
  const CalculatorButton('1'),
  const CalculatorButton('2'),
  const CalculatorButton('3'),
  const CalculatorButton(' + ', isColored: true, canBeFirst: false),
  const CalculatorButton('00'),
  const CalculatorButton('0'),
  const CalculatorButton('.'),
  const CalculatorButton('=', isEqualSign: true, canBeFirst: false),
];
