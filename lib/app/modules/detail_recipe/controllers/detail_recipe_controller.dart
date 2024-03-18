import 'package:get/get.dart';
import 'package:homework_5_1/app/modules/detail_recipe/model/recipe_model.dart';
import 'package:homework_5_1/app/modules/detail_recipe/providers/meal_provider.dart';

class DetailRecipeController extends GetxController {
  Future<MealRecipe> getMeal() async {
    final data = await MealProvider().getMeal();
    return data;
  }
}