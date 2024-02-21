import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http_test/model/timezone_model.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  static const String timeApiUrl =
      'http://worldtimeapi.org/api/timezone/Asia/Seoul';

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  TimeZoneModel? timeZoneModel;
  bool isFetching = false;
  @override
  initState() {
    super.initState();
    _setFetchingTime();
  }

  Future<void> _setFetchingTime() async {
    timeZoneModel = await fetchTime();
  }

  // http 통신을 통해 시간 정보를 가져오는 메서드
  Future<TimeZoneModel> fetchTime() async {
    final response = await http.get(Uri.parse(ClockScreen.timeApiUrl));
    // 200 OK 응답이면
    // 시간 정보를 json으로 변환하여 TimeZoneModel 객체로 변환하여 반환
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        isFetching = false;
      });
      return TimeZoneModel.fromJson(data);
    } else {
      // 200 OK 응답이 아니면 예외를 발생시킴 *(에러)
      throw Exception('Failed to load time');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: isFetching
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        isFetching = true;
                      });
                      await _setFetchingTime();
                    },
                    child: const Text('시간 가져오기'),
                  ),

                  if (timeZoneModel == null)
                    const CircularProgressIndicator()
                  else
                    TimeStreamWidget(
                      startDateTime: timeZoneModel!.getDateTime()!,
                    ),
                  // FutureBuilder(
                  //   future: fetchTime(),
                  //   builder: (context, timeZoneData) {
                  //     if (timeZoneData.hasData) {
                  //       return TimeStreamWidget(
                  //         startDateTime: timeZoneData.data!.getDateTime()!,
                  //       );
                  //     } else if (timeZoneData.hasError) {
                  //       return Text('Error: ${timeZoneData.error}');
                  //     } else {
                  //       return const CircularProgressIndicator();
                  //     }
                  //   },
                  // ),
                ],
              ),
      ),
    );
  }
}

class TimeStreamWidget extends StatelessWidget {
  final DateTime startDateTime;
  const TimeStreamWidget({super.key, required this.startDateTime});

  // 1초마다 시간을 가져오는 스트림
  Stream<DateTime> fetchTimeStream({required DateTime startDateTime}) async* {
    DateTime date = startDateTime;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      date = date.add(const Duration(seconds: 1));
      yield date;
    }
  }

  String getFormattedTime(DateTime dateTime) {
    return '${dateTime.year}년${dateTime.month}월${dateTime.day}일\n${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // 1초마다 시간을 가져오는 스트림을 사용하여 화면을 갱신
      stream: fetchTimeStream(
        startDateTime: startDateTime,
      ),
      builder: (context, timeStream) {
        // stream의 데이터가 있으면 && stream이 yield 되었으면
        // 해당 부분 UI 리빌드
        if (timeStream.hasData) {
          final DateTime dateTime = timeStream.data as DateTime;
          return Text(
            getFormattedTime(dateTime),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          );
        } else if (timeStream.hasError) {
          return Text('Error: ${timeStream.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
