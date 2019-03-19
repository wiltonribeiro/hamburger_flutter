import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hamburger_flutter/models/Item.dart';
import 'package:hamburger_flutter/models/Order.dart';
import 'package:hamburger_flutter/components/AddIngredients.dart';
import 'package:hamburger_flutter/blocs/AddIngredientsBloc.dart';
import 'package:hamburger_flutter/blocs/ItemBloc.dart';
import 'package:hamburger_flutter/blocs/OrderBloc.dart';
import 'package:hamburger_flutter/blocs/CartBloc.dart';
import 'package:hamburger_flutter/components/TextAnim.dart';
import 'package:hamburger_flutter/components/OrderWidget.dart';

class ItemDetails extends StatefulWidget {
  final Item item;
  ItemDetails({Key key, this.item}) : super(key:key);

  _ItemDetails createState() => new _ItemDetails();
}

class _ItemDetails extends State<ItemDetails> {

  ScrollController _scrollController;
  ItemBloc _itemBloc = new ItemBloc();
  OrderBloc _orderBloc = new OrderBloc();
  CartBloc _cartBloc = new CartBloc();
  double _orderWidgetSize;

  @override
  initState(){
    _scrollController = new ScrollController();
    _itemBloc.updateItem(widget.item);
    super.initState();
  }

  String _decimalPart(double num){
    String s = num.toStringAsFixed(2);
    return s.substring(s.indexOf('.')+1, s.length);
  }

  void _scrollJumpListener(BuildContext context){

    _orderWidgetSize = MediaQuery.of(context).size.height*0.2;
    _scrollController = new ScrollController(initialScrollOffset: MediaQuery.of(context).size.height*0.35);

    new AddIngredientsBloc().currentCategory.listen((data) {
          _scrollController.animateTo(_scrollController.position.minScrollExtent + _orderWidgetSize, curve: Curves.ease, duration: Duration(milliseconds: 200));
          new Timer(Duration(milliseconds: 200), (){
            _scrollController.animateTo(_scrollController.position.maxScrollExtent, curve: Curves.ease, duration: Duration(milliseconds: 200));
          });
    });
  }

  Widget _showPrice(){
    return new StreamBuilder(initialData: widget.item, stream: _itemBloc.currentItem, builder: (context, AsyncSnapshot<Item> snapshot){
      return new Row(children: <Widget>[
        new Text("\$", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 30)),
        new TextAnim(content: "${snapshot.data.calculatePrice().toInt()}.", fontSize: 40),
        new TextAnim(content: "${_decimalPart(snapshot.data.calculatePrice())}", fontSize: 15),
      ]);
    });
  }

  Widget build(BuildContext context) {

    _scrollJumpListener(context);

    return new Scaffold(
        appBar: new AppBar(
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {}
              )]),
        body: new Stack(children: <Widget>[
                new Image.network(widget.item.urlImage, fit: BoxFit.cover, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height),
                new SafeArea(child:
                  new Column(children: <Widget>[
                    new Padding(padding: EdgeInsets.all(20), child:
                      new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        new Flexible(child: new Text(widget.item.title, style: TextStyle(color: Theme.of(context).indicatorColor, fontWeight: FontWeight.bold, fontSize: 45)), flex: 2),
                        new Align(alignment: Alignment.bottomRight, child: _showPrice())
                      ])
                    )
                  ])
                ),
                new Container(child:
                  new CustomScrollView(physics: NeverScrollableScrollPhysics(),controller: _scrollController, slivers: <Widget>[
                      new SliverToBoxAdapter(child:
                        new OrderWidget(size: _orderWidgetSize)
                      ),
                      new SliverToBoxAdapter(child:
                        new Container(height: MediaQuery.of(context).size.height * 0.7)
                      ),
                     new SliverToBoxAdapter(child:
                      new AddIngredients()
                     )
                    ],
                  ),
                ),
                new Align(alignment: Alignment.bottomCenter, child:
                  new SizedBox(width: MediaQuery.of(context).size.width*0.8, child:
                      new StreamBuilder(stream: _orderBloc.currentOrder, builder: (context, AsyncSnapshot<Order> snapshot){
                        if(snapshot.data == null){
                          return new RaisedButton(elevation: 4, color: Theme.of(context).primaryColor,
                              onPressed: _finishOrder,
                              child: new Text("Add to Cart".toUpperCase(), style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold))
                          );
                        }
                        return new RaisedButton(elevation: 4, color: Colors.white,
                            onPressed: (){_addToCart(snapshot.data);},
                            child: new Text("OK".toUpperCase(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                        );
                      })
                  )
                )
          ]
        )
    );
  }

  void _addToCart(Order order){
      _cartBloc.addOrderToCart(order);
      Navigator.of(context).pop();
  }

  void _finishOrder(){
    _scrollController.animateTo(_scrollController.position.minScrollExtent, curve: Curves.ease, duration: Duration(milliseconds: 400));
    _orderBloc.createOrder(_itemBloc.item);
  }

  @override
  void dispose() {
    _orderBloc.dispose();
    _itemBloc.dispose();
    super.dispose();
  }

}