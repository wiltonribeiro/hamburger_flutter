import 'package:flutter/material.dart';
import 'package:hamburger_flutter/models/Ingredient.dart';
import 'package:hamburger_flutter/blocs/ItemBloc.dart';
import 'package:hamburger_flutter/models/Burger.dart';
import 'package:hamburger_flutter/models/Item.dart';

class IngredientWidget extends StatefulWidget {
  final Ingredient ingredient;

  IngredientWidget({Key key, this.ingredient}) : super(key:key);
  _IngredientWidget createState() => _IngredientWidget();

}

class _IngredientWidget extends State<IngredientWidget> {

  ItemBloc _itemBloc;

  initState(){
    _itemBloc = new ItemBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[

        new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          new Text(widget.ingredient.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          new Text("\$ ${widget.ingredient.price}")
        ]),

        new Column(children: <Widget>[
          new Row(children: <Widget>[
            new SizedBox(width: 40, height: 40, child:
              new FlatButton(onPressed: (){
                _itemBloc.removeExtraIngredient(widget.ingredient);
              }, child: new Icon(Icons.remove, size: 10), color: Colors.black12)
            ),
            new Padding(padding: EdgeInsets.symmetric(horizontal: 20), child:
                new StreamBuilder(
                    initialData: _itemBloc.item,
                    stream: _itemBloc.currentItem,
                    builder: (context, AsyncSnapshot<Item> snapshot){
                      var b = snapshot.data as Burger;
                      return new Text("${b.ingredientCount(widget.ingredient)}");
                })
            ),
            new SizedBox(width: 40, height: 40, child:
              new FlatButton(onPressed: () async {
                _itemBloc.addExtraIngredient(widget.ingredient);
              }, child: new Icon(Icons.add, size: 10), color: Colors.black12)
            ),
          ])
        ]),

    ]);
  }

}