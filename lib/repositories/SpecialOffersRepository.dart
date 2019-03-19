import 'package:hamburger_flutter/models/Burger.dart';


class SpecialOffersRepository {

  static List<Burger> _list = new List();


  void _fillList(){
    _list.add(new Burger(4.15, "Double X Bacon", "https://portal.minervafoods.com/files/como_fazer_hamburguer_caseiro.jpg", new List(), new List()));
    _list.add(new Burger(6.25, "X Cheedar", "https://i2.wp.com/www.bagagemdememorias.com/wp-content/uploads/2017/03/meal-fries-hamburger.jpg?fit=800%2C533&ssl=1", new List(), new List()));
    _list.add(new Burger(7.0, "Monster Chill", "https://www.integracaodaserra.com.br/wp-content/uploads/2018/05/shutterstock_361890473-1030x596.jpg", new List(), new List()));
    _list.add(new Burger(2.15, "Tradicional", "https://blog.grandchef.com.br/wp-content/uploads/2018/08/hamburgueria.jpg", new List(), new List()));
  }

  Future<List<Burger>> fetchSpecialOffers(){

    //simulate cache network request
    if(_list.isNotEmpty) return Future.delayed(Duration(seconds: 0), (){
      _list.clear();
      _fillList();
      return _list;
    });

    return Future.delayed(Duration(seconds: 3), (){
      _fillList();
      return _list;
    });
  }

}
