import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _result = '0';
  String _inputValue = '';
  String expression = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator'),),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            _result.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 40),
                          ),
                          Text(
                            _inputValue,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('%');
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      child: const Text('%', style: TextStyle(fontSize: 22),),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_inputValue != null && _inputValue.length > 0) {
                            _inputValue = _inputValue.substring(
                                0, _inputValue.length - 1);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      child: const Text(
                        'DEL',
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _inputValue = '';
                          _result = '0';
                        });
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      child: const Text('C', style: TextStyle(fontSize: 25)),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('+');
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      child: const Text(
                        '+',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    )),
                  ],
                )),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('7');
                      },
                      child: const Text('7', style: TextStyle(fontSize: 22)),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('8');
                      },
                      child: const Text('8', style: TextStyle(fontSize: 22)),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('9');
                      },
                      child: const Text('9', style: TextStyle(fontSize: 22)),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('-');
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      child: const Text(
                        '-',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    )),
                  ],
                )),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('4');
                      },
                      child: const Text('4', style: TextStyle(fontSize: 22)),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('5');
                      },
                      child: const Text('5', style: TextStyle(fontSize: 22)),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('6');
                      },
                      child: const Text('6', style: TextStyle(fontSize: 22)),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('*');
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.white,),
                      child: const Text(
                        '*',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    )),
                  ],
                )),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('1');
                      },
                      child: const Text('1', style: TextStyle(fontSize: 22)),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('2');
                      },
                      child: const Text('2', style: TextStyle(fontSize: 22)),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('3');
                      },
                      child: const Text('3', style: TextStyle(fontSize: 22)),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('/');
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.white,),
                      child: const Text(
                        '/',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    )),
                  ],
                )),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('0');
                      },
                      child: const Text('0', style: TextStyle(fontSize: 22)),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _peakValue('.');
                      },
                      child: const Text('.', style: TextStyle(fontSize: 25)),
                    )),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            // _equalPressed;
                            setState(() {
                              expression = _inputValue;
                              Parser p = Parser();
                              Expression exp = p.parse(expression);

                              ContextModel cm = ContextModel();
                              _result =
                                  '${exp.evaluate(EvaluationType.REAL, cm)}';
                            });
                          },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          child: const Text(
                            '=',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        )),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _peakValue(String inputValue) {
    setState(() {
      _inputValue += inputValue;
    });
  }
}
