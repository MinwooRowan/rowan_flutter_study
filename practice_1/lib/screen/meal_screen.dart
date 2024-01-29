import 'package:flutter/material.dart';
import 'package:practice_1/constant/color_constant.dart';
import 'package:practice_1/constant/image_path_constant.dart';
import 'package:practice_1/model/meal_model.dart';
import 'package:practice_1/screen/widget/text_container_widget.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key});

  // meal데이터를 네트워크에서 가져오는 것을 시뮬레이션
  Future<MealModel> getMealModel() async {
    await Future.delayed(const Duration(seconds: 2));
    return demoMealModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: _buildAppBar(),
      // 비동기(Future) 데이터를 가져올 때 사용하는 위젯
      body: FutureBuilder<MealModel>(
        // future: getMealModel()을 통해 가져온 데이터를 snapshot에 저장
        future: getMealModel(),
        builder: ((context, snapshot) {
          // future함수가 성공적으로 데이터를 가져왔을 때
          if (snapshot.hasData) {
            return MealLayout(
              demoMeal: snapshot.data!,
            );
            // future함수가 에러가 발생했을 때
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                '요리 데이터를 가져오는데\n에러가 발생했습니다.',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
            );
            // future함수가 데이터를 가져오는 중일 때
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
            // future함수가 데이터를 가져오지 못했을 때
          } else {
            return const Center(
              child: Text(
                '요리 데이터를 가져오는데\n에러가 발생했습니다.',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
            );
          }
        }),
      ),
    );
  }
}

class MealLayout extends StatelessWidget {
  // MealScreen에서 MealLayout을 호출할 때 MealModel을 넘겨줘야 함
  final MealModel demoMeal;
  // MealLayout({required this.demoMeal})을 통해 MealModel을 받음
  const MealLayout({super.key, required this.demoMeal});

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
                titleText: demoMeal.mealTitle,
              ),
              _MealInfoContainerWidget(
                mealInfo: demoMeal.mealInfo,
              ),
              _MealDescribe(
                mealDescribe: demoMeal.mealDescribe,
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
      width: double.infinity,
      child: Image.asset(
        ImagePathConstant.egg,
        fit: BoxFit.cover,
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
          TextContainer(
            titleText: 'TOTAL TIME',
            valueText: '${mealInfo.totalMin}min',
          ),
          TextContainer(
            titleText: 'YILED',
            valueText: '${mealInfo.serving}servings',
          ),
          TextContainer(
            titleText: 'INGREDIENT',
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
