import 'package:flutter/material.dart';
import 'package:hamburger_flutter/models/CategoryIngredient.dart';
import 'package:hamburger_flutter/blocs/AddIngredientsBloc.dart';

class CategoryIngredientWidget extends StatefulWidget{
  final CategoryIngredient categoryIngredient;

  CategoryIngredientWidget({Key key, this.categoryIngredient}) : super(key:key);

  _IngredientWidget createState() => _IngredientWidget();
}

class _IngredientWidget extends State<CategoryIngredientWidget> {

  AddIngredientsBloc _addIngredientsBloc;

  initState(){
    _addIngredientsBloc = new AddIngredientsBloc();
    super.initState();
  }

  Widget build(BuildContext context) {
    return new StreamBuilder(stream: _addIngredientsBloc.currentCategory, builder: (context, AsyncSnapshot<CategoryIngredient> snapshot){
      if(snapshot.data == widget.categoryIngredient)
        return _buildWidget(Theme.of(context).primaryColor);

      return _buildWidget(Colors.transparent);
    });
  }

  Widget _buildWidget(Color color){
    return new GestureDetector(
        onTap: (){
          _addIngredientsBloc.updateCurrentCategory(widget.categoryIngredient);
          },
        child: new Column(children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.height*0.1,
            height: MediaQuery.of(context).size.height*0.1,
            decoration: new BoxDecoration(
              color: const Color(0xff7c94b6),
              image: new DecorationImage(
                image: new NetworkImage(widget.categoryIngredient.urlToImage),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
              border: new Border.all(
                color: color,
                width: 4.0,
              ),
            ),
          ),
          new Center(child: new Padding(padding: EdgeInsets.only(top: 5), child: new Text(widget.categoryIngredient.name)))
        ])
    );
  }
}