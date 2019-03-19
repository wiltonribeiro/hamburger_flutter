import 'Item.dart';
import 'Ingredient.dart';

class Burger extends Item {

  List<Ingredient> _listIngredients;
  List<Ingredient> _listExtraIngredients;

  Burger(double price, String title, String urlToImage, this._listIngredients, this._listExtraIngredients) : super(price, title, urlToImage);

  Burger.fromJSON(Map<String, dynamic> data) : super.fromJSON(data) {
    var list = data["ingredients"] as List<Map<String, dynamic>>;
    _listIngredients.addAll(list.map((i) => new Ingredient.fromJSON(i)).toList());
  }

  void addExtraIngredient(Ingredient ingredient){
    _listExtraIngredients.add(ingredient);
  }

  void removeExtraIngredient(Ingredient ingredient){
    if(this.ingredientCount(ingredient)>0){
      for (Ingredient i in _listExtraIngredients){
        if(i.name == ingredient.name) {
          _listExtraIngredients.remove(i);
          break;
        }
      }
    }
  }

  List<Ingredient> get listIngredients => _listIngredients;

  List<Ingredient> get listExtraIngredients => _listExtraIngredients;

  @override
  double calculatePrice() {
    double value = super.price;
    listExtraIngredients.forEach((i){
      value += i.price;
    });
    return value;
  }

  int ingredientCount(Ingredient ingredient){
    int value = 0;
    listExtraIngredients.forEach((i){
      if(i.name == ingredient.name) value ++;
    });
    return value;
  }

}