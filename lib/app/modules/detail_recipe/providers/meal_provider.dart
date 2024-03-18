import 'package:get/get.dart';
import 'package:homework_5_1/app/modules/detail_recipe/model/recipe_model.dart';

class MealProvider extends GetConnect {
  final filter = Get.arguments;
  Future<MealRecipe> getMeal() async {
    final response = await get(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$filter');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return MealRecipe.fromJson(response.body as Map<String, dynamic>);
    }
  }
}
