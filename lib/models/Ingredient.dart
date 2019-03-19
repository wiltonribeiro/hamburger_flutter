class Ingredient {
  String _name;
  double _price;

  Ingredient(this._price, this._name);

  Ingredient.fromJSON(Map<String, dynamic> data) {
    this._name = data["name"];
    this._price = data["price"];
  }

  String get name => _name;

  double get price => _price;


}