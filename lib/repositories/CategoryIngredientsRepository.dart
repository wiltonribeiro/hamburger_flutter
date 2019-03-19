import 'package:hamburger_flutter/models/Ingredient.dart';
import 'package:hamburger_flutter/models/CategoryIngredient.dart';


class CategoryIngredientsRepository {

  static List<CategoryIngredient> _list = new List();


  void _fillList(){
    _list.add(new CategoryIngredient("Cheese", "https://sc02.alicdn.com/kf/UTB8Ps9bXnzIXKJkSafVq6yWgXXae/Mozzarella-Cheese-Frozen-Polish-Food-Block-2.jpg_350x350.jpg", [
      new Ingredient(1.5, "Cheddar"),
      new Ingredient(2, "Feta"),
      new Ingredient(1.05, "Gouda"),
      new Ingredient(1.45, "Oka"),
    ].toList()));
    _list.add(new CategoryIngredient("Vegetable", "https://www.healthline.com/hlcmsresource/images/AN_images/fruits-and-vegetables-thumb.jpg", [
      new Ingredient(1.8, "Sweet Potato"),
      new Ingredient(1.2, "Eggplant"),
      new Ingredient(0.86, "Tomato"),
      new Ingredient(1.0, "Zucchini"),
      new Ingredient(0.95, "Roasted Red Peppers"),
    ].toList()));
    _list.add(new CategoryIngredient("Meat", "https://i.dietdoctor.com/wp-content/uploads/2018/08/Peterson-meat.jpg?auto=compress%2Cformat&w=800&h=557&fit=crop", [
      new Ingredient(2.8, "Pepperoni"),
      new Ingredient(1.2, "Salami"),
      new Ingredient(0.86, "Turkey Breast"),
      new Ingredient(1.0, "Chicken Strips"),
      new Ingredient(0.95, "Roasted Chicken"),
      new Ingredient(2.1, "Teriyaki Chicken")
    ].toList()));
    _list.add(new CategoryIngredient("Sauce", "https://www.primaverakitchen.com/wp-content/uploads/2014/04/How-to-make-Basic-Tomato-Sauce-recipe-Primavera-Kitchen-5.jpg", [
      new Ingredient(1.0, "Chipotle Southwest"),
      new Ingredient(1.2, "Honey Mustard"),
      new Ingredient(0.86, "Ranch"),
      new Ingredient(1.0, "Savoury Caesar"),
    ].toList()));
  }

  Future<List<CategoryIngredient>> fetchCategories(){

    if(_list.isNotEmpty) return Future.delayed(Duration(seconds: 0), (){
      return _list;
    });

    return Future.delayed(Duration(seconds: 1), (){
      _fillList();
      return _list;
    });
  }

}
