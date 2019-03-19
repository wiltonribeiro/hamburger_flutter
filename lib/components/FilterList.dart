import 'package:flutter/material.dart';

class FilterLst extends StatelessWidget {
  
  final list = [
    "Cheese",
    "Chicken",
    "Fish",
    "Vegetarian",
    "Bacon"
  ];
  
  Widget build(BuildContext context) {
    return new Container(height: 60, child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: list.length, itemBuilder: (context, position) {
      return new Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: new Center(child: new Text(list[position], style: TextStyle(fontWeight: FontWeight.bold)))
      );
    }));
  }
  
}