import 'dart:ui';

import 'package:bmi/constants/app_const.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({ Key? key }) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController _hightcontroller = TextEditingController();
  TextEditingController _weightcontroller = TextEditingController();
  double _bmiresult = 0 ;
  String _textreslt = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator",style:TextStyle(color: Colors.yellow),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true
        ,),
     backgroundColor: Colors.black,
     body: SingleChildScrollView(
      child:Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
               width: 130,
               child: TextField(
                controller: _hightcontroller,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                  color: Colors.yellow
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Height",
                  hintStyle: TextStyle(
                    fontSize: 42,
                    color: Colors.white
                  )
                ),
               ), 
              ),
              Container(
               width: 130,
               child: TextField(
                controller: _weightcontroller,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                  color: Colors.yellow
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Mass",
                  hintStyle: TextStyle(
                    fontSize: 42,
                    color: Colors.white.withOpacity(.8)
                  )
                ),
               ), 
              )
            ],
          ),
          SizedBox(height: 30,),
           GestureDetector(
            onTap: () {
              double _h = double.parse(_hightcontroller.text);
              double _w = double.parse(_weightcontroller.text);
              setState(() {
                _bmiresult = _w / (_h * _h);
                if(_bmiresult > 25){
                  _textreslt = "You are Over Weight";
                }
                else if(_bmiresult >= 18.5 && _bmiresult<=25)
                {
                  _textreslt ="You have normal weight";
                }
                else 
                {
                  _textreslt = "You are under weight";
                }
              });

            },
            child: Container(
              child: Text("Calculate",style: TextStyle(
                fontSize:22,fontWeight: FontWeight.bold,color: Colors.yellow )
                ,),
            ),
          ),
           SizedBox(height: 50,),
          Container(
            child: Text(_bmiresult.toStringAsFixed(2),style: TextStyle(
              fontSize:90,fontWeight: FontWeight.bold,color: Colors.greenAccent )
              ,),
          ),
           SizedBox(height: 30,),
          Visibility(
            visible: _textreslt.isNotEmpty,
            child: Container(
            child: Text(_textreslt,style: TextStyle(
              fontSize:32,fontWeight: FontWeight.bold,color: Colors.yellow )
              ,),
            )
          ),
          SizedBox(height: 10,),
          leftbar(barWidth: 40),
          SizedBox(height: 20,),
          leftbar(barWidth: 70),
          SizedBox(height: 20,),
          leftbar(barWidth: 50),
          SizedBox(height: 10,),
          rightbar(barWidth: 70),
          SizedBox(height: 20,),
          rightbar(barWidth: 60),

        ],
      ) ,
      ),
    );
  }
}