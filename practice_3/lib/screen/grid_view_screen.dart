import 'package:flutter/material.dart';
import 'package:practice_3/model/food_model.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<FoodModel> foodModelList = demoFoodModelList;
    return Scaffold(
      // 반복되지 않는 위젯들을 스크롤되는 UI 안에 담고 싶을 때 ListView를 사용한다.
      // 반복되고 공통되는 위젯들을 스크롤되는 UI 안에 담고 싶을 때 ListView.builder를 사용한다.
      // ListView.builder가 ListView보다 더 메모리 성능이 좋고 기능이 많음.
      // (ListView builder 예시 참고)
      body: GridView.builder(
        itemCount: foodModelList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
