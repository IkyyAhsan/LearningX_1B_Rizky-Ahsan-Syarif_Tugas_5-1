import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework_5_1/app/modules/home/controllers/home_controller.dart';
import 'package:homework_5_1/app/modules/home/models/meal_food_model.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.black45,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: controller.filterMeals,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "List Meal From API",
              style:
                  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ).paddingOnly(bottom: 20.h),
            Flexible(
              child: Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.h,
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                  ),
                  itemBuilder: (_, index) =>
                      itemMeals(controller.filteredMeals, index),
                  itemCount: controller.filteredMeals.length,
                ),
              ),
            )
          ],
        ).paddingOnly(left: 20.w, right: 20.w, bottom: 10.h),
      ),
    );
  }

  GestureDetector itemMeals(List<Category> data, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/detail-recipe', arguments: data[index].strCategory);
      },
      child: Card(
        elevation: 0.6,
        color: Colors.white,
        child: Column(
          children: [
            Image.network(data[index].strCategoryThumb),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[index].strCategory,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15.sp),
                  ),
                  Text(
                    data[index].strCategoryDescription,
                    style: TextStyle(fontSize: 10.sp),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
