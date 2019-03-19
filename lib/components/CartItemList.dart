import 'package:flutter/material.dart';
import 'package:hamburger_flutter/models/Order.dart';

class CartItemList extends StatelessWidget {
  final Order order;
  CartItemList({Key key, this.order}) : super(key:key);

  Widget build(BuildContext context){
    return new Container(margin: EdgeInsets.only(right: 15), width: double.infinity, child:
      new Row(children: <Widget>[
        new SizedBox(height: 100, width: 30, child: new Stack(children: <Widget>[
          new Container(margin: EdgeInsets.only(left: 4),height: 100, width: 2, color: Theme.of(context).primaryColor),
          new Container(margin: EdgeInsets.only(top: 40),decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor), width: 10, height: 10)
        ])),
        new Expanded(child:
          new Padding(padding: EdgeInsets.only(left: 10, right: 10), child:
            new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              new Padding(padding: EdgeInsets.only(bottom: 5), child: new Text("${order.item.title}".toUpperCase(), style: TextStyle(fontSize: 20, color: Colors.black))),
              new Text("Quantity: ${order.quantity}".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black), textAlign: TextAlign.left),
              new Text("Cost: ${order.price.toStringAsFixed(2)}".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black), textAlign: TextAlign.left),
            ])
          )
        )
      ])
    );
  }

}