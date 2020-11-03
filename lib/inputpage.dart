import 'package:bmi/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/CustomWigets.dart';
import 'Constant.dart';
import 'package:bmi/AppBrain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
gender selectedGender;
int height=150;
int weight=60;
int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(children: [
                Expanded(
                  child: ReusableCard(
                    pressed: (){
                      setState(() {
                        selectedGender=gender.male;
                      });
                    },
                    colour: selectedGender==gender.male ? kActiveCardColor:kInactiveCardColor ,
                    cardChild: (
                    IconWidget(
                      cardIcon:FontAwesomeIcons.mars,
                      cardText: 'MALE',
                    )
                    ),
                  ),
                ),
                Expanded(child:  ReusableCard(
                  pressed: (){
                    setState(() {
                      selectedGender=gender.female;
                    });
                  },
                  colour: selectedGender==gender.female ? kActiveCardColor:kInactiveCardColor ,
                  cardChild: IconWidget(
                    cardIcon:FontAwesomeIcons.venus,
                    cardText: 'FEMALE',
                  ),
                ),
                ),
              ])
          ),
          Expanded(child:  ReusableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT' , style: kLabelStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(height.toString(), style: kNumStyle),
                  Text('cm')
                ],
              ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFEB1555),
                      inactiveTrackColor: Colors.grey,
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayColor: Color(0x1FEB1555),

                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double vale){
                      setState(() {
                        height=vale.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ),

          Expanded(
              child: Row(children: [
                Expanded(child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT' , style: kLabelStyle,),
                          Text(weight.toString(),style: kNumStyle,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  }
                              ),

                              SizedBox(
                                width: 10,
                              ),

                              IconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                })
                            ],
                          ),
                        ],

                      ),
                    ],
                  ),
                ),
                ),
                Expanded(child:  ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE' , style: kLabelStyle,),
                          Text(age.toString(),style: kNumStyle,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  }
                              ),

                              SizedBox(
                                width: 10,
                              ),

                              IconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),),
              ])
          ),
        ButtomCalculationButton(
          buttonName: 'CALCULATE',
          page: (){
            Brain newBrain= Brain(height: height , weight: weight);
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>ResultPage(

                  bmi: newBrain.calculate(),
                  result: newBrain.result(),
                  compliment: newBrain.compliment(),
                ),
            ),
            );
          },
        ),
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  IconButton({this.icon , this.onPressed});

  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      );
  }
}



