import 'package:flutter/material.dart';

const seatNum = 20;

class SeatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SeatPageStatus();
}

class _SeatPageStatus extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as List<String>;
    String? startStation = arguments[0];
    String? endStation = arguments[1];

    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    startStation,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30,
                  ),
                  Text(
                    endStation,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('선택됨'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text('선택안됨'),
                  ),
                ],
              ),
              RowsHeader(),
              SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: List.generate(seatNum, (i) => Rows(i + 1)),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '예매 하기',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 좌석 열 구분 헤더
Widget RowsHeader() {
  List<String> txt = ['A', '', 'B', '', ' ', '', 'C', '', 'D'];

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(txt.length, (i) {
      if (txt[i].isNotEmpty) {
        return Container(
          alignment: Alignment.bottomCenter,
          width: 50,
          height: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Text('${txt[i]}'),
        );
      } else {
        return SizedBox(width: 4);
      }
    }),
  );
}

/// 좌석 한 줄
Widget Rows(int idx) {
  return Padding(
    padding: idx != seatNum ? EdgeInsets.only(bottom: 8) : EdgeInsets.zero,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(9, (i) {
        return (i == 0 || i.isEven)
            ? seat(row: idx, col: i)
            : SizedBox(width: 4);
      }),
    ),
  );
}

/// 좌석 한개
Widget seat({required int row, required int col}) {
  return GestureDetector(
    onTap: () {
      print('row: $row / col: $col');
    },
    child: Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: (col == 4) ? null : Colors.grey[300]!,
      ),
      child: (col == 4) ? Text('$row') : null,
    ),
  );
}
