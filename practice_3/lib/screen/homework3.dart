import 'package:flutter/material.dart';

import 'profile.dart';

class HomeWork3 extends StatelessWidget {
  const HomeWork3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF131517),
        //  아이콘(뒤로가기)
        appBar: appBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  내 프로필
            // GetUser(1),
            Profile(peopleData: myData),
            const SizedBox(height: 30),
            //  채널관리(버튼)
            Center(
              child: Container(
                width: 500,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "채널관리",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                ),
              ),
            ),
            //  팔로워 정보(text)
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "팔로워 정보",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            //  팔로워 정보(실 데이터)
            for (int i = 0; i < lstPeopleData.length; i++)
              Profile(peopleData: lstPeopleData[i]),

            const SizedBox(height: 20),
            //  떠나간 친구(text)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "떠나간 친구",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            //  떠나간 친구(실 데이터)],
            for (int i = 0; i < lstleaveData.length; i++)
              Profile(peopleData: lstleaveData[i]),
          ],
        ));
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: const Color(0xFF131517),
      leading: IconButton(
        icon: const Icon(Icons.keyboard_backspace),
        color: Colors.white,
        onPressed: () {},
      ),
    );
  }
}

PeopleData myData = PeopleData(
    imageName: 'assets/images/egg.png',
    name: '송민호',
    detail: '팔로워 4명',
    type: UserType.master);

List<PeopleData> lstleaveData = [
  PeopleData(
      imageName: 'assets/images/egg.png',
      name: '안호성',
      detail: '떠나간 날 : 2023-11-20',
      type: UserType.leave)
];

List<PeopleData> lstPeopleData = [
  PeopleData(
      imageName: 'assets/images/egg.png',
      name: '박성균',
      detail: '가입일 : 2020-06-13',
      type: UserType.online),
  PeopleData(
      imageName: 'assets/images/egg.png',
      name: '최준채',
      detail: '가입일 : 2022-06-08',
      type: UserType.online),
  PeopleData(
      imageName: 'assets/images/egg.png',
      name: '이진미',
      detail: '가입일 : 2023-01-29',
      type: UserType.offline),
  PeopleData(
      imageName: 'assets/images/egg.png',
      name: '민사욱',
      detail: '가입일 : 2023-10-06',
      type: UserType.online),
];

// class GetUserTest extends StatelessWidget {
//   final int userArray;
//   const GetUserTest({super.key, this.userArray= -1});

//   @override
//   Widget build(BuildContext context) {
//     userArray
//     return const Placeholder();
//   }
// }

// class GetUser extends StatefulWidget {
//   final int userArray;

//   const GetUser( {Key? key, this.userArray=-1}) : super(key: key);

//   @override
//   State<GetUser> createState() => _MyAppState();
// }

// class _MyAppState extends State<GetUser> {

//   @override
//   Widget build(BuildContext context) {
//     return Profile(lstPeopleData[widget.userArray]);
//   }
// }
