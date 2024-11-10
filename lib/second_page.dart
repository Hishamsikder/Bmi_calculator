import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final weightController = TextEditingController();
  String selectbutton = '';
  void selectColumn(String columnValue) {
    setState(() {
      selectbutton = columnValue;
    });
  }

  double _currentSliderSecondaryValue = 0.2;
  int _counter = 60;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  double? _bmi;
  void calculateBMI() {
    if (_currentSliderSecondaryValue > 0) {
      setState(() {
        _bmi = _counter /
            (_currentSliderSecondaryValue * _currentSliderSecondaryValue);

      });
    }
  }





  @override
  Widget build(BuildContext context) {
    String formattedValue = _currentSliderSecondaryValue.toStringAsFixed(2);
    String newbmiValue = _bmi != null ? _bmi!.toStringAsFixed(1) : "";
    return Scaffold(
      backgroundColor: Color(0xff090D1F),
      appBar: AppBar(
        title: Text('Bmi Calculator',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        centerTitle: true,
        backgroundColor: Color(0xff090D1F),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    selectColumn('Man');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: selectbutton == 'Man'
                          ? Colors.white10
                          : Color(0xff090D1F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 15,
                      right: 10,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.man,
                          size: 120,
                          color: Colors.white,
                        ),
                        Text(
                          'Man',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => selectColumn('Woman'),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.only(
                      left: 0,
                      top: 15,
                    ),
                    decoration: BoxDecoration(
                      color: selectbutton == 'Woman'
                          ? Colors.white10
                          : Color(0xff090D1F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.woman,
                          size: 120,
                          color: Colors.white,
                        ),
                        Text(
                          'Woman',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Slider(
              max: 10,
              value: _currentSliderSecondaryValue,
              label: _currentSliderSecondaryValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderSecondaryValue = value;
                });
              },
            ),
            Text(
              'Height : $formattedValue m',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Weight',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_counter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Kg',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter();
                    },
                    child: Icon(Icons.add)),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      _decrementCounter();
                    },
                    child: Icon(Icons.minimize_rounded)),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                calculateBMI();
              },
              child: Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white12),
                child: Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
            ),
            Text(
              'You are a: $selectbutton \n your bmi is $newbmiValue',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Text( "a" , style: TextStyle(fontSize: 24, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

