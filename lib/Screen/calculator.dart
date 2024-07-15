import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/CalculatorProvider.dart';
import '../constant.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: mediaQuery.size.width * 0.04,
                  horizontal: mediaQuery.size.width * 0.04,
                ),
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 40.0,
                      child: ListView(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Consumer<CalculatorProvider>(
                            builder: (context, equation, child) => Text(
                              equation.equation,
                              style: const TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Consumer<CalculatorProvider>(
                      builder: (context, equation, child) => Text(
                        equation.result,
                        style: const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(15.0),
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.2,
                mainAxisSpacing: 5.0,
                crossAxisCount: 4,
                children: buttons,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
