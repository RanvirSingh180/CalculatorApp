import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {
  final color;
  final textcolor;
  final String bottonText;
final buttonPresseed;

  CalButton({this.color, this.textcolor,required this.bottonText,this.buttonPresseed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:buttonPresseed ,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(bottonText , style: TextStyle(color: textcolor,fontWeight: FontWeight.bold,fontSize: 18)),
            ),

          ),
        ),
      ),
    );
  }
}
