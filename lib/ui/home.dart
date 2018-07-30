import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateHomeSate();
  }
}

class CreateHomeSate extends State<Home> {
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  String _finalResult='';
  String _Bmi='';

  void _calculateBMI() {
    setState(() {
      String height=_heightController.text.toString();
      String age=_ageController.text.toString();
      String weight=_weightController.text.toString();
      if(height!=null && age!=null && weight!=null && int.parse(height)>0 && int.parse(age)>0 && int.parse(weight)>0 )
        {
          int height1 =int.parse(height);
          int age1=int.parse(age);
          int weight1=int.parse(weight);
          double finalAns=(weight1*10000)/(height1*height1);
          if(finalAns<18.5)
            {
              _Bmi='Underweight';
            }
            else if(finalAns>=18.5 && finalAns<=24.9)
              {
                _Bmi='Normal';
              }
              else if(finalAns>=25.0 && finalAns<=29.9)
                {
                  _Bmi='Overweight';
                }
                else if(finalAns>=30.0)
                  {
                    _Bmi='Obese';
                  }
          _finalResult=finalAns.toStringAsFixed(1);
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade700,
        centerTitle: true,
        title: Text(
          'BMI',
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
              child: Image.asset(
            'images/bmilogo.png',
            height: 133.0,
            width: 200.0,
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.grey.shade100,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _ageController,
                      style: TextStyle(fontSize: 20.0,color: Colors.black),
                      decoration: InputDecoration(
                          icon: Icon(Icons.person), hintText: 'Age',),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(fontSize: 20.0,color: Colors.black),
                      decoration: InputDecoration(
                          icon: Icon(Icons.person), hintText: 'Height in cm'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(fontSize: 20.0,color: Colors.black),
                      decoration: InputDecoration(
                          icon: Icon(Icons.person), hintText: 'Weight in kg'),
                    ),
                  ),
                  Container(
                    height: 100.0,
                    child: Center(
                        child: FlatButton(
                            onPressed: _calculateBMI,
                            color: Colors.pink.shade700,
                            child: Text(
                              'Calculate',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ))),
                  )
                ],
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              'Your BMI is '+_finalResult,
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          )),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              _Bmi,
              style: TextStyle(fontSize: 35.0, color: Colors.pink.shade700),
            ),
          ))
        ],
      ),
    );
  }
}
