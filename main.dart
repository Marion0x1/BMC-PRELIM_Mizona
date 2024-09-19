import 'package:flutter/material.dart';
 void main() => runApp(MyApp());

 class MyApp extends StatefulWidget {

  
   @override
 MyAppState createState() => MyAppState();

 }
  class MyAppState extends State<MyApp> {
    @override
 final List<String> _measures = [ 'meters',
 'kilometers', 'grams', 'kilograms', 'feet',
 'miles', 'pounds (lbs)', 'ounces',
 ];

 final TextStyle inputStyle = TextStyle(
                      fontSize: 20,
                      color: Colors.blue[900],
                      );
                      final TextStyle labelStyle = TextStyle(
                      fontSize: 24,
                      color: Colors.grey[700],
                      );
    Widget build(BuildContext context) {
      double _numberFrom=0;
      
      
       @override
 String? _startMeasure;
 void initState() {
 _numberFrom = 0; super.initState();
 }

     return MaterialApp(
       title: 'Measures Converter',
        home: Scaffold(
          appBar: AppBar(
             title: Text('Measures Converter'),
          ),
          
             body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              
             children: [  SizedBox(height: 20),
             

             DropdownButton(
            items: _measures.map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value),);
           }).toList(),
           onChanged: (value) {setState(() {
                        _startMeasure = value;
                      });
                      },value: _startMeasure
                    ),
            TextField(style: inputStyle,
                decoration: InputDecoration(
                hintText: "Please insert the measure to be converted",
                  ),
               onChanged: (text) {
                var rv = double.tryParse(text); if (rv != null) {
                setState(() {
                _numberFrom = rv;
                DropdownButton<String>(
                  isExpanded: true,
                  items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  );
                  }).toList(),
                  onChanged: (value) {
                  setState(() {
                  _startMeasure = value;
                  });
                  },
                  value: _startMeasure,
                  );

                });
                }
              },
             ),Text((_numberFrom == null) ? '' : _numberFrom.toString())
           ],
          ),
          ),
        )
       )
       );
   }
}