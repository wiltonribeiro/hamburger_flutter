import 'package:flutter/material.dart';
import 'package:hamburger_flutter/models/Burger.dart';
import 'package:hamburger_flutter/blocs/SpecialOfferBloc.dart';
import 'ItemWidget.dart';

class SpecialOffer extends StatefulWidget {
  _SpecialOffer createState() => _SpecialOffer();
}

class _SpecialOffer extends State<SpecialOffer> {

  SpecialOfferBloc _offerBloc = new SpecialOfferBloc();

  @override
  initState(){
    _offerBloc.fetchOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(padding: EdgeInsets.symmetric(horizontal: 10), child:
      new Column(children: <Widget>[
        new Align(alignment: Alignment.centerLeft, child: new Text("Special Offers".toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey))),
        new Container(height: 240, child:
          new StreamBuilder(
              stream: _offerBloc.allOffers,
              builder: (context,  AsyncSnapshot<List<Burger>> snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) return new Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));

                if (snapshot.hasData) {
                  return _buildList(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
              }
          )
        )
      ])
    );
  }

  static const Widget bla = null;

  Widget _buildList(List<Burger> list){
    return
      new ListView.builder(itemCount: list.length, scrollDirection: Axis.horizontal, itemBuilder: (context, position) {
        return Container(padding: EdgeInsets.only(right: 10, top: 20), child:
          new ItemWidget(item: list[position])
        );
      });
  }

  @override
  void dispose() {
    _offerBloc.dispose();
    super.dispose();
  }
}