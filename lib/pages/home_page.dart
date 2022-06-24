import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seip_class3_flutter_state/settings.dart';

class HomePage extends StatefulWidget {
  final String msg;

  const HomePage({Key? key, required this.msg}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;
  final _nameController = TextEditingController();

  double _result = 0.0;

  @override
  void dispose() {
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.msg),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BDT'),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Enter BDT Amount',
                ),
              ),
            ),

            Text('To'),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _calculate(ConversionType.DOLLAR);
                    },
                    child: const Text('Us Dollar')),
                ElevatedButton(
                    onPressed: () {
                      _calculate(ConversionType.GBP);
                    },
                    child: const Text('GBP')),
                ElevatedButton(
                    onPressed: () {
                      _calculate(ConversionType.EURO);
                    },
                    child: const Text('Euro')),
              ],
            ),

            // const Text('You have pushed this button many times'),
            const SizedBox(height: 2,),
            Text(
              _result.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _increment,
      //   child: Icon(Icons.add),
      // ),
    );
  }

  _increment() {
    setState(() {
      _count++;
    });
  }

  _calculate(ConversionType type) {
    final input = double.parse(_nameController.text);
    var rate = 0.0;
    switch (type) {
      case ConversionType.DOLLAR:
        rate = dollarToBdt;
        break;

      case ConversionType.GBP:
        rate = gbbToBdt;
        break;

      case ConversionType.EURO:
        rate = euroToBdt;
        break;
    }
    setState((){
      _result = input/rate;
    });
  }
}
