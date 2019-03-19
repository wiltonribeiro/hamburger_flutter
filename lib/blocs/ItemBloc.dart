import 'package:rxdart/rxdart.dart';
import 'package:hamburger_flutter/models/Item.dart';
import 'package:hamburger_flutter/models/Burger.dart';
import 'package:hamburger_flutter/models/Ingredient.dart';

class ItemBloc {

  static ItemBloc _itemBloc;

  PublishSubject<Item> _publishSubjectCurrentItem;
  Item _item;

  factory ItemBloc(){
    if(_itemBloc == null)
      _itemBloc = new ItemBloc._();

    return _itemBloc;
  }

  ItemBloc._(){
    _publishSubjectCurrentItem = new  PublishSubject<Item>();
  }

  Item get item => _item;

  updateItem(Item item){
    _item = item;
    _publishSubjectCurrentItem.sink.add(_item);
  }

  addExtraIngredient(Ingredient ingredient){
    Burger burger = _item as Burger;
    burger.addExtraIngredient(ingredient);
    updateItem(burger);
  }

  removeExtraIngredient(Ingredient ingredient){
    Burger burger = _item as Burger;
    burger.removeExtraIngredient(ingredient);
    updateItem(burger);
  }

  Observable<Item> get currentItem => _publishSubjectCurrentItem.stream;

  dispose(){
    _itemBloc = null;
    _publishSubjectCurrentItem.close();
  }

}