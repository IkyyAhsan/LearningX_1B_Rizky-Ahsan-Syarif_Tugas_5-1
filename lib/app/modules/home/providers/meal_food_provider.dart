import 'package:get/get.dart';
import 'package:homework_5_1/app/modules/home/models/meal_food_model.dart';

class MealFoodProviders extends GetConnect{
  Future<MealsFoodModel> getMealFoods() async {
    final response = await get('https://www.themealdb.com/api/json/v1/1/categories.php');
    if (response.status.hasError){
      return Future.error(response.statusText!);
    }else{
      return MealsFoodModel.fromJson(response.body as Map<String, dynamic>);
    }
  }
}