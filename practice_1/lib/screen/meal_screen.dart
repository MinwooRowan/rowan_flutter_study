import 'package:flutter/material.dart';
import 'package:practice_1/constant/color_constant.dart';
import 'package:practice_1/constant/image_path_constant.dart';
import 'package:practice_1/model/meal_model.dart';
import 'package:practice_1/screen/widget/text_container_widget.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: _buildAppBar(),
      body: MealLayout(
        mealData: demoMealModel,
      ),
    );
  }
}

class MealLayout extends StatelessWidget {
  // MealScreen에서 MealLayout을 호출할 때 MealModel을 넘겨줘야 함
  final MealModel mealData;
  // MealLayout({required this.demoMeal})을 통해 MealModel을 받음
  // required는 호출하는 쪽에서 명시적으로 어떤 파라미터에 어떤 값을 넘겨줘야 하는지 알려주는 역할
  // required를 사용하지 않으면
  // const MealLayout(this.demoMeal, {super.key}); 과 같이 사용 가능
  const MealLayout({super.key, required this.mealData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ImageWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleTextWidget(
                titleText: mealData.mealTitle,
              ),
              _MealInfoContainerWidget(
                mealInfo: mealData.mealInfo,
              ),
              _MealDescribe(
                mealDescribe: mealData.mealDescribe,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      // 화면 상 가로 길이를 꽉 채우기 위해 double.infinity 사용
      width: double.infinity,
      child: Image.asset(
        ImagePathConstant.egg,
        fit: BoxFit.cover,
        // fit: BoxFit.fill,
        // fit: BoxFit.contain,
        // fit: BoxFit.fitWidth,
        // fit: BoxFit.fitHeight,
        // 등이 있음
      ),
    );
  }
}

class _TitleTextWidget extends StatelessWidget {
  final String titleText;
  const _TitleTextWidget({required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titleText,
          style: const TextStyle(
            color: ColorConstant.greenColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(
          height: 1,
          color: ColorConstant.greenColor,
        ),
      ],
    );
  }
}

class _MealInfoContainerWidget extends StatelessWidget {
  final MealInfoModel mealInfo;
  const _MealInfoContainerWidget({required this.mealInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextColumnContainer(
            titleText: 'TOTAL TIME',
            // '' 안에 ${}를 사용하여 변수를 넣어 String으로 사용할 수 있음
            valueText: '${mealInfo.totalMin}min',
          ),
          TextColumnContainer(
            titleText: 'YILED',
            valueText: '${mealInfo.serving}servings',
          ),
          TextColumnContainer(
            titleText: 'INGREDIENT',
            // 다른 string과 조합없이 String 변수만 사용할 경우 변수명만 넣을 수 있으나
            // string타입이 아닌 변수인 경우 .toString() 혹은 '${}'를 사용해야 함
            valueText: mealInfo.mainIngredient,
          ),
        ],
      ),
    );
  }
}

class _MealDescribe extends StatelessWidget {
  final String mealDescribe;
  const _MealDescribe({required this.mealDescribe});

  @override
  Widget build(BuildContext context) {
    return Text(
      mealDescribe,
      style: const TextStyle(
        height: 1.7,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: ColorConstant.textColor,
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    centerTitle: false,
    backgroundColor: ColorConstant.appBarColor,
    actions: [
      IconButton(
        onPressed: () {
          print('People Icon Pressed');
        },
        icon: const Icon(
          Icons.people,
          color: ColorConstant.orangeColor,
        ),
      ),
      IconButton(
        onPressed: () {
          print('Favorite Icon Pressed');
        },
        icon: const Icon(
          Icons.favorite_border,
          color: ColorConstant.orangeColor,
        ),
      ),
    ],
    title: const Text(
      'Meal',
      style: TextStyle(
        color: ColorConstant.orangeColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
