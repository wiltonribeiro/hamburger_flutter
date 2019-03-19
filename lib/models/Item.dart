abstract class Item {

  String _title;
  String _urlToImage;
  double _price;

  Item(this._price, this._title, this._urlToImage);

  Item.fromJSON(Map<String, dynamic> data) {
    this._title = data["title"];
    this._price = data["price"];
    this._urlToImage = data["urlToImage"];
  }

  String get title => _title;

  String get urlImage => _urlToImage;

  double get price => _price;

  double calculatePrice();



}