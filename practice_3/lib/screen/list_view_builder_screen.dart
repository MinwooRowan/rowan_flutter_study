import 'package:flutter/material.dart';
import 'package:practice_3/model/food_model.dart';

class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 예시로 만들어둔 demoFoodModelList를 foodModelList에 넣어준다.
    List<FoodModel> foodModelList = demoFoodModelList;
    return Scaffold(
      body: ListView.builder(
        // itemCount는 foodModelList의 길이만큼
        // itemBuilder는 itemCount 만큼 반복된다.
        itemCount: foodModelList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodModelList[index].name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  foodModelList[index].price,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  foodModelList[index].description,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
