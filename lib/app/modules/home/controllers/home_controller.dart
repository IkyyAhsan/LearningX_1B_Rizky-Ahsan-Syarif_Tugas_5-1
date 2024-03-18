import 'package:get/get.dart';
import 'package:homework_5_1/app/modules/home/models/meal_food_model.dart';
import 'package:homework_5_1/app/modules/home/providers/meal_food_provider.dart';

class HomeController extends GetxController {
  RxList<Category> _mealsList = <Category>[].obs;
  RxList<Category> _filteredMeals = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMealFood();
  }

  Future<void> fetchMealFood() async {
    final data = await MealFoodProviders().getMealFoods();
    _mealsList.assignAll(data.categories);
    _filteredMeals.assignAll(_mealsList);
  }

  List<Category> get filteredMeals => _filteredMeals;

  void filterMeals(String query) {
    List<Category> filteredMeals = _mealsList.where((meal) {
      return meal.strCategory.toLowerCase().contains(query.toLowerCase());
    }).toList();
    _filteredMeals.assignAll(filteredMeals);
  }
}