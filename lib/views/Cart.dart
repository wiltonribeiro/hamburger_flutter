import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hamburger_flutter/models/Cart.dart' as CartEntity;
import 'package:hamburger_flutter/blocs/CartBloc.dart';
import 'package:hamburger_flutter/blocs/IconsBloc.dart';
import 'package:hamburger_flutter/components/CartItemList.dart';

class Cart extends StatefulWidget {
  _Cart createState() => new _Cart();
}

class _Cart extends State<Cart> {

  IconsBloc _iconsBloc = new IconsBloc();
  CartBloc _cartBloc = new CartBloc();

  initState(){
    _iconsBloc.notifyCartIcon(false);
    super.initState();
  }

  Widget build(BuildContext context){
    return new Scaffold(floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor, child: new Icon(Icons.check), onPressed: (){}),
        body: new Padding(padding: EdgeInsets.all(20), child:
            new StreamBuilder(initialData: _cartBloc.cart, stream: _cartBloc.getCart, builder: (context, AsyncSnapshot<CartEntity.Cart> snapshot){
                  if(snapshot.data==null || snapshot.data.totalPrice == 0) return _emptyCart();

                  else{

                    return new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                      new Text("Total cost", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                      new Text("\$${snapshot.data.totalPrice.toStringAsFixed(2)}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                      new Expanded(child:
                        new Container(margin: EdgeInsets.only(top: 20), child:
                          new ListView.builder(itemCount: snapshot.data.orders.length, itemBuilder: (context, position) {
                            final order = snapshot.data.orders[position];
                            return Dismissible(key: Key(order.id.toString()), child:
                              new CartItemList(order: order),
                              onDismissed: (direction){
                               _cartBloc.removeOrderToCart(order);
                              },
                              background: Container(color: Colors.redAccent),
                            );
                          })
                        )
                      )
                    ]);

                  }

            })
        )
    );
  }

  Widget _emptyCart(){
    return new Center(child: new Text("Cart is empty"));
  }

}