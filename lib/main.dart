import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
@override
  MyAppState createState() => MyAppState();
  
}
class MyAppState extends State<MyApp> 
{
  String? _startMeasure; //will contain the selected value from the dropdownbutton
  String? _convertedMeasure;
  String _resultMessage = '';
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
  // convert _measures strings into numbers
  // Maps => Dictionaries in C#
  final Map<String, int> _measuresMap = {
    'meters' : 0,
    'kilometers' : 1,
    'grams' : 2,
    'kilograms' : 3,
    'feet' : 4,
    'miles' : 5,
    'pounds (lbs)' : 6,
    'ounces' : 7,
  };


  final dynamic _formulas = {
    '0':[1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0 ],
    '1':[1000, 1,0, 0, 3280.84, 0.621371, 0, 0],
    '2':[0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274 ],
    '3':[0, 0, 1000, 1, 0, 0, 2.20462, 35.274 ],
    '4':[0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0 ],
    '5':[1609.34, 1.60934, 0, 0, 5280, 1, 0, 0 ],
    '6':[0, 0, 453.592, 0.453592, 0, 0, 1, 16 ],
    '7':[0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1 ],
  };
  
  double _numberForm = 0;
  @override
  void initState() {
    _numberForm = 0;
    super.initState();
  }

  Widget build(BuildContext context) 
  {
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
                  onPressed: () {
                    if(_startMeasure!.isEmpty || _convertedMeasure!.isEmpty || _numberForm == 0){
                      return;
                    }
                    else {
                      convert(_numberForm, _startMeasure!, _convertedMeasure!);
                    }
                  },
                ),

                const SizedBox(height: 30),

                Text((_resultMessage == '') ? '' : _resultMessage.toString(), 
                  style: labelStyle),

                const SizedBox(height: 30),

              ],
            )
          ),
      ),
      ),
  );
  }

  void convert(double value, String from, String to)
  {
    int? nFrom = _measuresMap[from];
    int? nTo = _measuresMap[to];
    var multiplier = _formulas[nFrom.toString()][nTo];
    var result = value * multiplier;

    if( result == 0 )
    {
      _resultMessage = 'This conversion cannot be performed';
    }
    else {
      _resultMessage = '${_numberForm.toString()} $_startMeasure are ${result.toStringAsFixed(4)} $_convertedMeasure';
    }
    setState(() {
      _resultMessage = _resultMessage;
    });
  }
}
