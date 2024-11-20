import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';
import 'package:flutter_train_app/pages/station/station_list_page.dart';

const startStationChar = '출발역';
const endStationChar = '도착역';
bool? isDarkTheme;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String startStation = startStationChar;
  String endStation = endStationChar;

  @override
  Widget build(BuildContext context) {
    isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('기차 예매'),
      ),
      body: Container(
        color: isDarkTheme! ? Colors.black : Colors.grey[200],
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              infoArea(),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.purple),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (startStation != startStationChar &&
                          endStation != endStationChar &&
                          startStation != endStation) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SeatPage(),
                              settings: RouteSettings(
                                  arguments: [startStation, endStation])),
                        );
                      }
                    },
                    child: const Text(
                      '좌석 선택',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container infoArea() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: isDarkTheme! ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stationArea(isStartStation: true),
          Container(
            width: 2,
            height: 50,
            color: isDarkTheme! ? Colors.grey : Colors.black,
          ),
          stationArea(isStartStation: false),
        ],
      ),
    );
  }

  Expanded stationArea({required bool isStartStation}) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          String select = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StationListPage(),
                settings: RouteSettings(arguments: [
                  isStartStation,
                  isStartStation ? endStation : startStation,
                ])),
          );

          setState(() {
            isStartStation ? startStation = select : endStation = select;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isStartStation ? startStationChar : endStationChar,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(
              isStartStation ? startStation : endStation,
              style: const TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
