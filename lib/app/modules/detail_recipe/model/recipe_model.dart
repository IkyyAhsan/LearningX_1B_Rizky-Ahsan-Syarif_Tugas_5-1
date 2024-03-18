import 'dart:convert';

MealRecipe mealFromJson(String str) => MealRecipe.fromJson(json.decode(str));

String mealToJson(MealRecipe data) => json.encode(data.toJson());

class MealRecipe {
  List<MealRecipeElement> meals;

  MealRecipe({
    required this.meals,
  });

  factory MealRecipe.fromJson(Map<String, dynamic> json) => MealRecipe(
        meals: List<MealRecipeElement>.from(
            json["meals"].map((x) => MealRecipeElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

class MealRecipeElement {
  String strMeal;
  String strMealThumb;
  String idMeal;

  MealRecipeElement({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory MealRecipeElement.fromJson(Map<String, dynamic> json) => MealRecipeElement(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };
}