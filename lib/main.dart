import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
@override
  MyAppState createState() => MyAppState();
  
}
class MyAppState extends State<MyApp> {
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
