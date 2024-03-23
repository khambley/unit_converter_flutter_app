import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
@override
  MyAppState createState() => MyAppState();
  
}
class MyAppState extends State<MyApp> {
  String? _startMeasure; //will contain the selected value from the dropdownbutton

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
              items: _measures.map((String? value)
              {
                return DropdownMenuItem<String> (
                  value: value,
                  child: Text(value ?? ""),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _startMeasure = value ?? "";
                });
              },
              value: _startMeasure, //needs this to read the selected value
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
