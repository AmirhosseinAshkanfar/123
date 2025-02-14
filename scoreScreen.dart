import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatelessWidget {

  final double bmiScore;

  final int age;
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;
   ScoreScreen({Key? key, required this.bmiScore,required this.age}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    setbmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Text('B M I score'),
            Icon(Icons.calculate_rounded)
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your Score',style: TextStyle(fontSize: 30,color: Colors.blue),),
              SizedBox(height: 10,),
              PrettyGauge(
                gaugeSize: 300,
                minValue: 0,
                maxValue: 40,
                segments: [
                  GaugeSegment('UnderWeight', 18.5, Colors.red),
                  GaugeSegment('Normal', 6.4, Colors.green),
                  GaugeSegment('OverWeight', 5, Colors.orange),
                  GaugeSegment('Obese', 10.1, Colors.pink),
                ],
                valueWidget: Text(bmiScore.toStringAsFixed(1),style: TextStyle(fontSize: 40),),
                currentValue: bmiScore.toDouble(),
                needleColor: Colors.blue,
              ),
              SizedBox(height: 10,),
              Text(bmiStatus!, style: TextStyle(fontSize: 20,color: bmiStatusColor!),),
              SizedBox(height: 10,),
              Text(bmiInterpretation!, style: TextStyle(fontSize: 15),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text('Re-calculate')),
                  SizedBox(width: 10,),
                  ElevatedButton(
                      onPressed: (){
                        Share.share('Your bmi is ${bmiScore.toStringAsFixed(1)} at age $age');
                      },
                      child: Text('share'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void setbmiInterpretation(){
    if(bmiScore >30){
      bmiStatus='Obse';
      bmiInterpretation='Plese work to reduce obesity';
      bmiStatusColor=Colors.pink;
    }
    else if(bmiScore >= 25){
      bmiStatus='OverWeight';
      bmiInterpretation='Do regular exercise & reduce weight';
      bmiStatusColor=Colors.orange;
    }
    else if(bmiScore >= 18.5){
      bmiStatus='Normal';
      bmiInterpretation='Enjoy';
      bmiStatusColor=Colors.green;
    }
    else if(bmiScore >= 18.5){
      bmiStatus='UnderWeight';
      bmiInterpretation='try to increase the weight';
      bmiStatusColor=Colors.red;
    }
  }
}
