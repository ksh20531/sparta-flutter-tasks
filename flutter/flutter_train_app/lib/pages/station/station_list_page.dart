import 'package:flutter/material.dart';

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
            child: list(idx),
          );
        },
      ),
    );
  }

  Column list(int idx) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          child: Text(
            stationList[idx],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[300]!,
              ),
            ),
          ),
        )
      ],
    );
  }
}
