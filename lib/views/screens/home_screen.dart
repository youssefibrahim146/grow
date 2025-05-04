import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow/constants/extensions.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controllers/home_controller.dart';
import '../widgets/notification.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          const NotificationIcon(),
          5.gap,
          IconButton(
            onPressed: () {
              controller.signOut();
            },
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
        title: Text(
          controller.user.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              25.gap,
              Text(
                "Your Plane: ${controller.user.plan.toUpperCase()} Weight",
                style: TextStyle(
                  color: AppColors.darkNbetyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: AppColors.darkGoldColor,
                thickness: 2,
                indent: 115,
                endIndent: 115,
              ),
              25.gap,
              Text(
                "Workout Plan",
                style: TextStyle(
                  color: AppColors.darkNbetyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: AppColors.darkGoldColor,
                thickness: 2,
                indent: 145,
                endIndent: 145,
              ),
              45.gap,
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.94,
                ),
                itemCount: controller.workouts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.darkGoldColor,
                        width: 1,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          child: Image.network(
                            controller.workouts[index]["image"],
                            fit: BoxFit.cover,
                            height: 90,
                            width: double.infinity,
                          ),
                        ),
                        10.gap,
                        Text(
                          controller.workouts[index]["name"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        5.gap,
                        Text(
                          controller.workouts[index]["description"],
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              20.gap,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppStrings.chatRoute);
        },
        backgroundColor: AppColors.darkGoldColor,
        child: const Icon(Icons.chat),
      ),
    );
  }
}
