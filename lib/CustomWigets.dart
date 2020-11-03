import 'package:bmi/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/CustomWigets.dart';
import 'Constant.dart';
class IconWidget extends StatelessWidget {
  IconWidget({this.cardIcon,this.cardText});
  final IconData cardIcon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          color : Colors.white,
          size: 80,
        ),
        SizedBox(height: 4,),
        Text('$cardText', style: kLabelStyle),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({this.colour , this.cardChild, this.pressed});
  final Color colour;
  final Widget cardChild;
  final Function pressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
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



class ButtomCalculationButton extends StatelessWidget {
  ButtomCalculationButton({@required this.buttonName, this.page});
  final String buttonName;
  final Function page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: page,
      child: Container(
        child: Center(child: Text(
          buttonName, style : kcalculateButton,
        )),
        height: 80,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        color: Color(0xFFEB1555),
      ),
    );
  }
}


