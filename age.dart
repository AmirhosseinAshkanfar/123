import 'package:flutter/material.dart';
class Age extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;

  const Age({Key? key,
    required this.onChange,
    required this.title ,
    required this.initValue,
    required this.min,
    required this.max})
      : super (key: key);
  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {

  int coounter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coounter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 12,
      shape: RoundedRectangleBorder(),
      child: Column(
      children: [
      Text(widget.title,style: TextStyle(fontSize: 20 , color: Colors.grey),),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.remove,color: Colors.white,),
                ) ,
                onTap: (){
                  setState(() {
                    if(coounter > widget.min){
                      coounter--;
                    }
                  });
                  widget.onChange(coounter);
                },
              ),

              SizedBox(width: 15,),
              Text(coounter.toString(),textAlign: TextAlign.center,style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
              SizedBox(width: 15,),

              InkWell(
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add,color: Colors.white,),
                ) ,
                onTap: (){
                  setState(() {
                    if(coounter < widget.max){
                      coounter++;
                    }
                  });
                  widget.onChange(coounter);
                },
              ),
            ],
          ),
        )
      ],
      ),
    ),
    );
  }
}
