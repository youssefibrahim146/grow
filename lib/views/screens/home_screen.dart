import 'package:carousel_slider/carousel_slider.dart';
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
              CarouselSlider.builder(
                itemCount: controller.banners.length,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  height: 150,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  autoPlayCurve: Curves.easeIn,
                ),
                itemBuilder: (_, int index, __) {
                  return Container(
                    width: 420,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.darkGoldColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(controller.banners[index], fit: BoxFit.cover),
                    ),
                  );
                },
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
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.94,
                ),
                itemCount: controller.workouts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(AppStrings.gymDetailsRoute, arguments: [
                        controller.workouts[index],
                      ]);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
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
