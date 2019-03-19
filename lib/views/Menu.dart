import 'package:flutter/material.dart';
import 'package:hamburger_flutter/components/FilterList.dart';
import 'package:hamburger_flutter/components/AdsBurger.dart';
import 'package:hamburger_flutter/components/SpecialOffer.dart';

class Menu extends StatelessWidget {

  Menu({Key key}) : super(key:key);

  Widget build(BuildContext context) {
    return new SingleChildScrollView(child:
      new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        new Container(margin: EdgeInsets.only(top: 10), child: new FilterLst()),
        new Container(margin: EdgeInsets.only(top: 20), child: new AdsBurger()),
        new Container(margin: EdgeInsets.only(top: 40, bottom: 20), child: new SpecialOffer())
      ])
    );
  }

}