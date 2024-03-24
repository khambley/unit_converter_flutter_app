import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
@override
  MyAppState createState() => MyAppState();
  
}
class MyAppState extends State<MyApp> {
  String? _startMeasure; //will contain the selected value from the dropdownbutton
  String? _convertedMeasure; 
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

    // Style widget for TextFields, DropdownButtons, and Button
    final TextStyle inputStyle = TextStyle(
      fontSize: 20,
      color: Colors.blue[900]
    );

    // Style widget for Text
    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.grey[700]
    );

    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: Scaffold(
      appBar: AppBar(
          title: const Text('Unit Converter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          )),
          backgroundColor: Colors.blueAccent,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(             
              children: [
                  const SizedBox(height: 30),

                  Text(
                    'Welcome to Distance & Weight Conversions!', 
                    style: labelStyle,
                    textAlign: TextAlign.center,             
                  ),

                  const SizedBox(height: 30),

                  TextField(
                    style: inputStyle,
                    decoration: const InputDecoration(
                      hintText: "Enter a value to convert..."
                    ),
                    onChanged: (text) {
                      var rv = double.tryParse(text);
                      if (rv != null) {
                        setState(() {
                          _numberForm = rv;
                        });
                      }
                    }
                  ),

                  const SizedBox(height: 30),

                  Text(
                    'From',
                    style: labelStyle,
                  ),

                  const SizedBox(height: 30),

                  DropdownButton (
                    isExpanded: true,
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

                  const SizedBox(height: 30),
                  Text(
                    'To',
                    style: labelStyle,
                  ),

                  DropdownButton (
                    isExpanded: true,
                    items: _measures.map((String? value)
                    {
                      return DropdownMenuItem<String> (
                        value: value,
                        child: Text(value ?? ""),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _convertedMeasure = value ?? "";
                      });
                    },
                    value: _convertedMeasure, //needs this to read the selected value
                  ),
                
                const SizedBox(height: 30),

                ElevatedButton(
                  child: Text('Convert', style: inputStyle),
                  onPressed: () => true,
                ),

                const SizedBox(height: 30),

                Text(_numberForm.toString(), style: labelStyle),

                const SizedBox(height: 30),

              ],
            )
          ),
      ),
      ),
  );}
}
