import 'package:bmi/Constant.dart';
import 'package:bmi/CustomWigets.dart';
import 'package:flutter/material.dart';
import 'inputpage.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.bmi,this.result,this.compliment});
  final String bmi;
  final String result;
  final String compliment;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(child: Text('Your Result' , style: kResulrstyle, )),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result , style: kResultTextColor,),
                  Text(bmi, style: kMainResultNum),
                  Text(compliment, style: kResulrstyle1),
                ],
              ),
            ),
          ),
          ButtomCalculationButton(
            buttonName: 'Re-Calculate',
            page : (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>InputPage()
              ),
              );
            },
          ),

        ],
      ),
    );
  }
}
