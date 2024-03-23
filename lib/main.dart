import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
@override
  MyAppState createState() => MyAppState();
  
}
class MyAppState extends State<MyApp> {
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];
  double _numberForm = 0;
  @override
  void initState() {
    _numberForm = 0;
    super.initState();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      home: Scaffold(
      appBar: AppBar(
          title: Text('Unit Converter'),
      ),

      body: Center(
          child: Column(
            children: [
              
            DropdownButton (
              items: _measures.map((String value)
              {
                return DropdownMenuItem<String> (
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),

            TextField(
            onChanged: (text) {
              var rv = double.tryParse(text);
              if (rv != null) {
                setState(() {
                  _numberForm = rv;
                });
              }
            }
          ),

          Text(_numberForm.toString())
          ],)

      ),),

  );}
}
