import 'package:flutter/material.dart';

class height extends StatefulWidget {
  final Function(int) onChange;
  const height({Key? key, required this.onChange}) : super (key: key);

  @override
  State<height> createState() => _heightState();
}

class _heightState extends State<height> {
  int _height = 150;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(),
      child: Column(
        children: [
          Text('height',style: TextStyle(fontSize: 25, color: Colors.grey),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_height.toString() , style:  TextStyle(fontSize: 40),),
              SizedBox(height: 10,),
              Text('cm' , style:  TextStyle(fontSize : 20, color: Colors.grey), )
            ],
          ),
          Slider(
            min: 0,
            max: 240,
            value: _height.toDouble(),
            onChanged: (value) {
              setState(() {
                _height = value.toInt();
              });
              widget.onChange(_height);
            },
          )
        ],
       ),
      ),
    );
  }
}
