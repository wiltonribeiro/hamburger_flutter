import 'Order.dart';

class Cart {

  List<Order> _orders;

  Cart(){
    _orders = new List();
  }

  void addOrder(Order order){
    order.id = _orders.length+1;
    _orders.add(order);
  }
  
  void removeOrder(Order order){
    _orders.remove(order);
  }

  List<Order> get orders => _orders;
  
  double get totalPrice {
    double value = 0;
    _orders.forEach((order) => value += order.price);
    return value;
  }

}