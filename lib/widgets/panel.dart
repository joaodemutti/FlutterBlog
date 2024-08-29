import 'package:flutter/material.dart';

class Panel extends StatelessWidget{
  final String data;
  const Panel(this.data,{super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Colors.grey,width: 2)), 
      width: 150,
      height: 250,
      child:Center(child: Text(data),)
      );
  }
}