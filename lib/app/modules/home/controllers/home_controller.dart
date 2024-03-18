import 'package:get/get.dart';
import 'package:homework_5_1/app/modules/home/models/meal_food_model.dart';
import 'package:homework_5_1/app/modules/home/providers/meal_food_provider.dart';

class HomeController extends GetxController {
  Future<MealsFoodModel> getMealFood() async {
    final data = await MealFoodProviders().getMealFoods();
    return data;
  }
}
