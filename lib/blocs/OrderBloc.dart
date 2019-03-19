import 'package:rxdart/rxdart.dart';
import 'package:hamburger_flutter/models/Item.dart';
import 'package:hamburger_flutter/models/Order.dart';

class OrderBloc{
  Order _currentOrder;
  PublishSubject<Order> _publishSubjectOrder;

  static OrderBloc _orderBloc;
  factory OrderBloc(){
    if(_orderBloc == null)
      _orderBloc = new OrderBloc._();

    return _orderBloc;
  }

  OrderBloc._(){
    _publishSubjectOrder = new PublishSubject<Order>();
  }

  Observable<Order> get currentOrder => _publishSubjectOrder.stream;

  void createOrder(Item item){
    _currentOrder = new Order(item);
    _publishSubjectOrder.sink.add(_currentOrder);
  }

  void increment(){
    _currentOrder.quantity++;
    _publishSubjectOrder.sink.add(_currentOrder);
  }

  void decrement(){
    if(_currentOrder.quantity>0){
      _currentOrder.quantity--;
      _publishSubjectOrder.sink.add(_currentOrder);
    }
  }

  dispose(){
    _orderBloc = null;
    _publishSubjectOrder.close();
  }

}