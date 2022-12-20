import 'package:helloworld/constants/app_constants.dart';
import 'package:helloworld/widgets/left_bar.dart';
import 'package:helloworld/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _happResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Happiness Calculator",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w800),
          ),
          leading: Icon(
            Icons.menu,
          ),
          backgroundColor: Colors.transparent,
          elevation: 2,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Confidence",
                        hintStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.deepPurple.withOpacity(0.9)),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Self-Doubt",
                        hintStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.deepPurple.withOpacity(.9)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    //_bmiResult = _w / (_h * _h);
                    _happResult = _h - _w;
                    if (_happResult >= 8) {
                      _textResult = "Such a happy soul!";
                    } else if (_happResult <= 7 && _happResult >= 4) {
                      _textResult = "You can do better!";
                    } else {
                      _textResult = "Fix yourself asap!";
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "Find your happiness score",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  _happResult.toStringAsFixed(1),
                  style: TextStyle(fontSize: 90, color: accentHexColor),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textResult,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: accentHexColor),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(barWidth: 70),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 70),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 70),
            ],
          ),
        ));
  }
}
