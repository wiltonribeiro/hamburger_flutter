import 'package:hamburger_flutter/models/Ingredient.dart';

class CategoryIngredient {
  String _name;
  String _urlToImage;
  List<Ingredient> _list;

  CategoryIngredient(this._name, this._urlToImage, this._list);

  CategoryIngredient.fromJSON(Map<String, dynamic> data) {
    var list = data["ingredients"] as List<Map<String, dynamic>>;

    this._name = data["name"];
    this._urlToImage = data["urlToImage"];
    this._list.addAll(list.map((i) => new Ingredient.fromJSON(i)).toList());
  }

  List<Ingredient> get list => _list;

  String get name => _name;

  String get urlToImage => _urlToImage;


}