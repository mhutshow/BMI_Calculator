import 'dart:math';
class Brain{
  Brain({this.height,this.weight});
  final int weight;
  final int height;
  double _bmi;
  String calculate() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String result(){
    if(_bmi>25){
      return 'OVERWEIGHT';
    }
    if(_bmi>18.5){
      return 'NORMAL';
    }
    else{
      return 'UNDERWEIGHT';
    }
  }

  String compliment(){
    if(_bmi>25){
      return 'Try exercise more and loose your weight';
    }
    if(_bmi>18.5){
      return 'You body BMI is healthy.Great JOB';
    }
    else{
      return 'You Should try to eat more. ';
    }
  }

}