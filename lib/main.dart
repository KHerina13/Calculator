import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/CalculatorProvider.dart';
import 'Screen/calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: MaterialApp(
        title: 'Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: const Color(0xff000000),
        ),
        home: const CalculatorScreen(),
      ),
    );
  }
}
