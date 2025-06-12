import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ArithmeticPage(),
    );
  }
}

class ArithmeticPage extends StatefulWidget {
  const ArithmeticPage({super.key});

  @override
  State<ArithmeticPage> createState() => _ArithmeticPageState();
}

class _ArithmeticPageState extends State<ArithmeticPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';

  void _calculate(String operator) {
    final double? num1 = double.tryParse(_num1Controller.text);
    final double? num2 = double.tryParse(_num2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        _result = 'Enter valid numbers ';
      });
      return;
    }

    double res;
    switch (operator) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          _result = 'Cannot divide by zero  11';
          setState(() {});
          return;
        }
        res = num1 / num2;
        break;
      default:
        res = 0;
    }

    setState(() {
      _result = 'Result: $res';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Arithmetic Operations')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           TextField(
  controller: _num1Controller,
  keyboardType: TextInputType.number,
  decoration: const InputDecoration(
    labelText: 'Enter first number ',
    border: OutlineInputBorder(), // Adds box border
    fillColor: Color.fromARGB(255, 53, 49, 7),
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10), // Optional padding
  ),
),
  const SizedBox(height: 16,),
           TextField(
  controller: _num2Controller,
  keyboardType: TextInputType.number,
  decoration: const InputDecoration(
    labelText: 'Enter second number ',
    border: OutlineInputBorder(), // Adds box border
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10), // Optional padding
  ),
),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => _calculate('+'), child: const Text('+')),
                ElevatedButton(onPressed: () => _calculate('-'), child: const Text('-')),
                ElevatedButton(onPressed: () => _calculate('*'), child: const Text('×')),
                ElevatedButton(onPressed: () => _calculate('/'), child: const Text('÷')),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              _result,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
