
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow/constants/extensions.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controllers/signup_controller.dart';
import '../widgets/form_field_widget.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              20.gap,
              Image.asset("assets/img.png",scale: 3,),
              20.gap,
              Container(
                width: double.infinity,
                padding: 10.edgeInsetsAll,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: 30.borderRadiusTop,
                ),
                child: Form(
                  key: controller.signUpFormStateKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),

                    child: Column(
                      children: [
                        GetBuilder<SignUpController>(
                          builder: (_) {
                            return InkWell(
                              // onTap: controller.incrementIndex,
                              child: Text(
                                "Create new account",
                                style: TextStyle(
                                  color: AppColors.darkNbetyColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            );
                          },
                        ),
                        15.gap,
                        FormFieldWidget(
                          textController: controller.nameController,
                          labelName: "Name",
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: AppColors.lightNbetyColor,
                          ),
                          onSaved: (String? value) {
                            controller.name = value!.trim();
                            controller.update();
                          },
                          onChanged: (_) {
                            controller.checkFields();
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.nameField +
                                  AppStrings.spaceSign +
                                  AppStrings.isRequiredValidation;
                            } else if (value.length < 3) {
                              return AppStrings.nameField +
                                  AppStrings.spaceSign +
                                  AppStrings.lessThen4Validation;
                            }
                            return null;
                          },
                        ),
                        15.gap,
                        FormFieldWidget(
                          textController: controller.emailController,
                          labelName: AppStrings.emailText,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.lightNbetyColor,
                          ),
                          onSaved: (String? value) {
                            controller.email = value!.trim();
                            controller.update();
                          },
                          onChanged: (_) {
                            controller.checkFields();
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.emailText +
                                  AppStrings.spaceSign +
                                  AppStrings.isRequiredValidation;
                            } else if (!RegExp(r"^[^@.]$").hasMatch(value[0]) ||
                                !RegExp(
                                  r"^[^@.]$",
                                ).hasMatch(value[value.length - 1]) ||
                                RegExp(r'[^\w@.]').hasMatch(value)) {
                              return AppStrings.invalidEmailValidation;
                            } else if (!value.contains(AppStrings.atSign)) {
                              return AppStrings.emailDoesNotContainAtValidation;
                            }
                            return null;
                          },
                        ),
                        15.gap,
                        FormFieldWidget(
                          textController: controller.weightController,
                          labelName: "Weight",
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: AppColors.lightNbetyColor,
                          ),
                          onSaved: (String? value) {
                            controller.weight = value!.trim();
                            controller.update();
                          },
                          onChanged: (_) {
                            controller.checkFields();
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.weightField +
                                  AppStrings.spaceSign +
                                  AppStrings.isRequiredValidation;
                            }
                            return null;
                          },
                        ),
                        15.gap,
                        FormFieldWidget(
                          textController: controller.heightController,
                          labelName: "Height",
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: AppColors.lightNbetyColor,
                          ),
                          onSaved: (String? value) {
                            controller.height = value!.trim();
                            controller.update();
                          },
                          onChanged: (_) {
                            controller.checkFields();
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.heightField +
                                  AppStrings.spaceSign +
                                  AppStrings.isRequiredValidation;
                            }
                            return null;
                          },
                        ),
                        15.gap,
                        FormFieldWidget(
                          textController: controller.drugTimeController,
                          labelName: "Drug Time Ex. 8 pm",
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: AppColors.lightNbetyColor,
                          ),
                          onSaved: (String? value) {
                            controller.drugTime = value!.trim();
                            controller.update();
                          },
                          onChanged: (_) {
                            controller.checkFields();
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.drugTimeField +
                                  AppStrings.spaceSign +
                                  AppStrings.isRequiredValidation;
                            }
                            return null;
                          },
                        ),
                        15.gap,
                        FormFieldWidget(
                          textController: controller.planController,
                          labelName: "Plan ex. gain, loss",
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: AppColors.lightNbetyColor,
                          ),
                          onSaved: (String? value) {
                            controller.plan = value!.trim();
                            controller.update();
                          },
                          onChanged: (_) {
                            controller.checkFields();
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.planField +
                                  AppStrings.spaceSign +
                                  AppStrings.isRequiredValidation;
                            }
                            return null;
                          },
                        ),
                        15.gap,
                        // gender radio button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Gender",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.darkNbetyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        GetBuilder<SignUpController>(
                          builder: (controller) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: controller.gender == "Male"
                                        ? AppColors.darkNbetyColor
                                        : AppColors.lightNbetyColor,
                                  ),
                                  onPressed: () {
                                    controller.gender = "Male";
                                    controller.update();
                                  },
                                  child: Text(
                                    "Male",
                                    style: TextStyle(
                                      color: controller.gender == "Male"
                                          ? AppColors.whiteColor
                                          : AppColors.darkNbetyColor,
                                    ),
                                  ),
                                ),
                                20.gap, // Add spacing between buttons
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: controller.gender == "Female"
                                        ? AppColors.darkNbetyColor
                                        : AppColors.lightNbetyColor,
                                  ),
                                  onPressed: () {
                                    controller.gender = "Female";
                                    controller.update();
                                  },
                                  child: Text(
                                    "Female",
                                    style: TextStyle(
                                      color: controller.gender == "Female"
                                          ? AppColors.whiteColor
                                          : AppColors.darkNbetyColor,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        15.gap,
                        GetBuilder<SignUpController>(
                          builder: (context) {
                            return FormFieldWidget(
                              labelName: AppStrings.passwordText,
                              obscure: controller.obscure,
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: AppColors.darkNbetyColor,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  controller.obscure = !controller.obscure;
                                  controller.update();
                                },
                                child: Icon(
                                  controller.obscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: AppColors.darkNbetyColor,
                                ),
                              ),
                              onSaved: (String? value) {
                                controller.password = value!.trim();
                                controller.update();
                              },
                              onChanged: (_) {
                                controller.checkFields();
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.passwordText +
                                      AppStrings.spaceSign +
                                      AppStrings.isRequiredValidation;
                                } else if (value.length < 8) {
                                  return AppStrings.passwordText +
                                      AppStrings.spaceSign +
                                      AppStrings.lessThen8Validation;
                                } else if (value.length > 24) {
                                  return AppStrings.passwordText +
                                      AppStrings.spaceSign +
                                      AppStrings.largerThen24Validation;
                                }
                                return null;
                              },
                            );
                          }
                        ),
                        // sign up button
                        20.gap,
                        GetBuilder<SignUpController>(
                          builder: (_) {
                            return InkWell(
                              onTap: () {
                                controller.signUp();
                              },
                              child: AnimatedContainer(
                                duration: 500.milSec,
                                width: (MediaQuery.of(context).size.width - 120),
                                padding: 10.edgeInsetsAll,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.darkNbetyColor,
                                  borderRadius: 15.borderRadiusAll,
                                ),
                                child:
                                controller.isLoading
                                    ? const CircularProgressIndicator(
                                  color: AppColors.whiteColor,
                                )
                                    : Text(
                                  AppStrings.signUpText,
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
