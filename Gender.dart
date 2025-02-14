
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  final Function(int) onChange;
  const Gender({Key? key, required this.onChange}) : super (key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {

  int _gender = 0;

  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
      topColor: Colors.blue,
      backColor: Colors.grey,
      borderRadius: BorderRadius.circular(30)
  );

  final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
  topColor: Colors.white,
  backColor: Colors.grey.shade300,
  borderRadius: BorderRadius.circular(30)
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender == 1? selectedStyle : unselectedStyle,
            onSelected: (){
              setState(() {
                _gender=1;
              });
              widget.onChange(_gender);
            },
              onUnSelected: (){},
            selected: _gender==1,
              child: Column(
                children: [
                  Icon(Icons.male,size: 50,),
                  Text('Male',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                ],
              ),
          ),
          SizedBox(width: 30),
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style:  _gender == 2? selectedStyle : unselectedStyle,
            onSelected: (){
              setState(() {
                _gender=2;
              });
              widget.onChange(_gender);
            },
            onUnSelected: (){},
            selected: _gender==2,
            child: Column(
              children: [
                Icon(Icons.female,size: 50,),
                Text('Female',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
