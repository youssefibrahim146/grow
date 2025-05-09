import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow/constants/colors.dart';
import 'package:grow/controllers/home_controller.dart';


class GymCardDetails extends GetWidget<HomeController> {
  const GymCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
   Map<String,dynamic>  workout = Get.arguments[0];
    return Scaffold(
      appBar: AppBar(
        title:  Text("Details",style: TextStyle(color: AppColors.darkGoldColor),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              workout["name"],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.network(workout["image"]),
            const SizedBox(height: 10),
            Text(
              workout["description"],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
