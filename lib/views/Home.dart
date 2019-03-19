import 'package:flutter/material.dart';
import 'package:hamburger_flutter/blocs/IconsBloc.dart';
import 'package:hamburger_flutter/blocs/CartBloc.dart';
import 'Menu.dart';
import 'Cart.dart';

class Home extends StatefulWidget {
  _Home createState() => new _Home();
}

class _Home extends State<Home> {

  IconsBloc _iconsBloc = new IconsBloc();
  CartBloc _cartBloc = new CartBloc();
  int _selectedIndex = 0;

  final _widgetOptions = [
    new Menu(),
    new Center(child: new Text('TO DO')),
    new Cart(),
    new Center(child: new Text('TO DO')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLUTTER BURGER', style: TextStyle(color: Theme.of(context).accentColor)),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: new Theme(data: Theme.of(context).copyWith(canvasColor: Theme.of(context).accentColor, textTheme: Theme.of(context).textTheme.copyWith(caption: new TextStyle(color: Theme.of(context).indicatorColor))),
      child:  new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('Menu')),
          BottomNavigationBarItem(icon: new Stack(
              children: <Widget>[
                new Icon(Icons.favorite),
                new StreamBuilder(stream: _iconsBloc.favoritesNotification, initialData: false, builder: (context, AsyncSnapshot snapshot){
                  if(!snapshot.data) return Container(height: 0, width: 0);
                  return _badge();
                })
              ]
          ), title: Text('Favorites')),
          BottomNavigationBarItem(icon: new Stack(
              children: <Widget>[
                new Icon(Icons.shopping_cart),
                new StreamBuilder(stream: _iconsBloc.cartNotification, initialData: false, builder: (context, AsyncSnapshot snapshot){
                  if(!snapshot.data) return Container(height: 0, width: 0);
                  return _badge();
                })
              ]
          ), title: new Text("Cart")),
          BottomNavigationBarItem(icon:
          new Stack(
              children: <Widget>[
                new Icon(Icons.person),
                new StreamBuilder(stream: _iconsBloc.profileNotification, initialData: false, builder: (context, AsyncSnapshot snapshot){
                  if(!snapshot.data) return Container(height: 0, width: 0);
                  return _badge();
                })
              ]
          ), title: Text('Profile')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      )),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _badge(){
    return new Positioned(top: 0.0, right: 0.0, child: new Icon(Icons.brightness_1, size: 8.0, color: Colors.amber));
  }

  @override
  void dispose() {
    _iconsBloc.dispose();
    _cartBloc.dispose();
    super.dispose();
  }

}