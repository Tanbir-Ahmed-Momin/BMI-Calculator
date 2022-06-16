import 'package:bmi/screens/home.dart';
import 'package:flutter/material.dart';

 void main() {
  runApp(BmiCal());
}
class BmiCal extends StatelessWidget {
  const BmiCal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      home: home(),
    );
  }
}