import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:homework_5_1/app/modules/detail_recipe/model/recipe_model.dart';

import '../controllers/detail_recipe_controller.dart';

class DetailRecipeView extends GetView<DetailRecipeController> {
  get title => Get.arguments;
  const DetailRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$title Recipe'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: FutureBuilder(
              future: controller.getMeal(),
              builder: (_, snapshot) {
                var data = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: data?.meals.length,
                      itemBuilder: (BuildContext context, int index) {
                        return itemMeal(data?.meals, index);
                      });
                } else {
                  return const Center(
                    child: Text("Data Kosong"),
                  );
                }
              }),
        ));
  }

  Container itemMeal(List<MealRecipeElement>? data, int index) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 190.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(data![index].strMealThumb),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(1), Colors.transparent],
              ), // Warna hitam dengan opasitas 0.6
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data[index].strMeal,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
