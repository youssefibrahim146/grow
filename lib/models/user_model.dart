import '../constants/strings.dart';

class UserModel {
  String email, name, gender, weight, height, drugTime,plan;

  UserModel({
    required this.email,
    required this.name,
    required this.gender,
    required this.weight,
    required this.height,
    required this.drugTime,
    required this.plan,
  });

  Map<String, dynamic> asMap() {
    Map<String, dynamic> user = {
      AppStrings.emailField: email,
      AppStrings.nameField: name,
      AppStrings.heightField: height,
      AppStrings.drugTimeField: drugTime,
      AppStrings.genderField:gender,
      AppStrings.weightField: weight,
      AppStrings.planField: plan,
    };
    return user;
  }

  factory UserModel.asModel(Map<String, dynamic> map) {
    UserModel user = UserModel(
      email: map[AppStrings.emailField],
      name: map[AppStrings.nameField],
      height: map[AppStrings.heightField],
      drugTime: map[AppStrings.drugTimeField],
      gender: map[AppStrings.genderField],
      weight: map[AppStrings.weightField],
      plan: map[AppStrings.planField],
    );
    return user;
  }
}
