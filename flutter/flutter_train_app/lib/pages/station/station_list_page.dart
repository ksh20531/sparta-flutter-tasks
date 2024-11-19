import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/station/station_name.dart';

class StationListPage extends StatelessWidget {
  List<String> stationList = [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산'
  ];

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as List;
    bool stationType = arguments[0];

    stationList.remove(arguments[1]);

    return Scaffold(
      appBar: AppBar(
        title: Text(stationType ? '출발역' : '도착역'),
      ),
      body: ListView.builder(
        itemCount: stationList.length,
        itemBuilder: (BuildContext context, int idx) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, stationList[idx]);
            },
            child: StationName(stationList[idx]),
          );
        },
      ),
    );
  }
}
