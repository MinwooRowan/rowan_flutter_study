void main() {
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      continue;
    }
    print(i);
  }

  List<int> numbers = [1, 2, 3, 4, 5];

  for (int number in numbers) {
    print(number);
  }
  numbers.forEach((number) {
    print(number);
  });

  // List를 순회하며 특정 조건에 해당하는 아이템들을 Iterable로 반환한다.
  numbers.where((number) => number % 2 == 0).forEach((number) => print(number));

  // forEach와 map 모두 List를 순회하면서 각 아이템 마다 특정 작업을 수행한다.
  // forEach와 map의 차이
  // forEach는 아무것도 반환하지 않는다.
  // map은 Iterable을 반환한다.
  numbers.forEach((number) => print(number));
  numbers
      .map((number) => number = number + 100)
      .forEach((number) => print(number));

  // Map
  Map<String, int> map = {
    'a': 1,
    'b': 2,
    'c': 3,
  };
  // Map을 순회하며 특정 작업을 수행한다.
  map.forEach((key, value) {
    print('$key: $value');
  });

  while (true) {
    print('Hello');
    break;
  }
}
