import 'Item.dart';

class Order {
  Item _item;
  int _quantity;
  int id;

  Order(this._item){
    this._quantity = 1;
  }

  int get quantity => _quantity;


  set quantity(int value) {
    _quantity = value;
  }

  Item get item => _item;

  double get price => _item.calculatePrice()*_quantity;

}