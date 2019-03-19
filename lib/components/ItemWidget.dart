import 'package:flutter/material.dart';
import 'package:hamburger_flutter/models/Item.dart';
import 'PriceTag.dart';
import 'package:hamburger_flutter/views/ItemDetails.dart';

class ItemWidget extends StatelessWidget {

  final Item item;
  final double heightContainer = 220;
  final double widthContainer = 170;
  final BoxDecoration _shadowDecoration = new BoxDecoration(boxShadow: [BoxShadow(color: Colors.black, blurRadius: 50, spreadRadius: 1.0, offset: Offset(10.0, 10.0,),)]);

  ItemWidget({Key key, this.item}) : super(key: key);

  Widget build(BuildContext context) {
   return new GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => new ItemDetails(item: item)));}, child:
       new SizedBox(width: widthContainer, height: heightContainer, child:
        new Stack(children: <Widget>[
          new ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)), child:
            new Image.network(item.urlImage, fit: BoxFit.cover, width: widthContainer, height: heightContainer)
          ),
          new Container(padding: EdgeInsets.all(20), child:
            new PriceTag(price: item.price)
          ),
          new Align(alignment: Alignment.bottomLeft, child:
            new Container(decoration: _shadowDecoration, margin: EdgeInsets.all(20), child:
              new Text(item.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Theme.of(context).indicatorColor))
            ),
          )
        ])
      )
     );
  }
}