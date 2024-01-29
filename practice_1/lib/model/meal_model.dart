import 'package:practice_1/constant/image_path_constant.dart';

class MealModel {
  final String mealTitle;
  final MealInfoModel mealInfo;
  final String mealDescribe;
  final String mealImagePath;

  MealModel({
    required this.mealTitle,
    required this.mealInfo,
    required this.mealDescribe,
    required this.mealImagePath,
  });
}

class MealInfoModel {
  final double totalMin;
  final int serving;
  final String mainIngredient;

  MealInfoModel({
    required this.totalMin,
    required this.serving,
    required this.mainIngredient,
  });
}

final MealModel demoMealModel = MealModel(
  mealTitle: 'Pesto Eggs',
  mealDescribe:
      'The pesto adds a massive flavor boost to traditional fried eggs. Instead of using oil or butter to cook your eggs. you spread a thin layer of pesto in a frying pan and cook the eggs slowly till they have nice crispy edges, but a still runny center.',
  mealImagePath: ImagePathConstant.egg,
  mealInfo: MealInfoModel(
    totalMin: 30,
    serving: 2,
    mainIngredient: 'Egg',
  ),
);
