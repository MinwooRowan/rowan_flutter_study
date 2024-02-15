import 'package:flutter/material.dart';

enum UserType { master, online, offline, leave }

class PeopleData {
  final String imageName; //  사진 경로
  final String name; //  이름
  final String detail; //  설명
  final UserType type;

  PeopleData(
      {required this.imageName,
      required this.name,
      required this.detail,
      required this.type}); //  상태 0:main 1:Online 2:OffLine

  // PeopleData(String imageName, String _name, String _detail, UserType _type) {
  //   imageName = imageName;
  //   name = _name;
  //   detail = _detail;
  //   type = _type;
  // }
}

class Profile extends StatelessWidget {
  final PeopleData peopleData;
  // final String imageName; //  사진 경로
  // final String name; //  이름
  // final String detail; //  설명
  // final userType type; //  상태 0:main 1:Online 2:OffLine

  // const Profile(
  //     this._peopleData, this.imageName, this.name, this.detail, this.type,
  //     {Key? key})
  //     : super(key: key);

  const Profile({required this.peopleData, Key? key}) : super(key: key);
  //const Profile({super.key});

  static double pictureHeight = 100;
  static double nameFontSize = 28;
  static double detailFontSize = 15;

  @override
  Widget build(BuildContext context) {
    switch (peopleData.type) {
      case UserType.master:
        pictureHeight = 80;
        nameFontSize = 28;
        detailFontSize = 15;
      default:
        pictureHeight = 65;
        nameFontSize = 20;
        detailFontSize = 12;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: pictureHeight,
        width: double.infinity,
        child: Row(
          children: [
            addSpace(20),
            //  이미지
            Image.asset(
              peopleData.imageName,
              height: pictureHeight,
            ),
            addSpace(40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    peopleData.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: nameFontSize,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0),
                  ),
                  addSpace(5),
                  getIcon(),
                ]),
                Text(
                  peopleData.detail,
                  style: TextStyle(
                      color: const Color(0xFF989898),
                      fontSize: detailFontSize,
                      letterSpacing: 2.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox addSpace(double dSize) {
    return SizedBox(
      width: dSize,
    );
  }

  Icon getIcon() {
    Icon _icon;
    if (peopleData.type == UserType.online) {
      _icon = const Icon(
        Icons.circle,
        color: Color(0xFF75FF44),
        size: 10,
      );
    } else if (peopleData.type == UserType.offline) {
      _icon = const Icon(
        Icons.circle,
        color: Color(0xFF989898),
        size: 10,
      );
    } else if (peopleData.type == UserType.leave) {
      _icon = const Icon(
        Icons.circle,
        color: Color(0xFF131517),
        size: 10,
      );
    } else {
      _icon = const Icon(
        Icons.circle,
        color: Color(0xFF131517),
        size: 10,
      );
    }
    return _icon;
  }
}
