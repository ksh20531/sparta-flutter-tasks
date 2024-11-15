import 'package:flutter/material.dart';

const seatNum = 20;

class SeatRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '출발역',
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
              '도착역',
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
    );
  }
}

/// 열 헤더
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

/// 좌석 한 행
Widget Rows(int idx) {
  return Padding(
    padding: idx != seatNum ? EdgeInsets.only(bottom: 8) : EdgeInsets.zero,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(9, (i) {
        return (i == 0 || i.isEven)
            ? seat(i == 4 ? idx : null)
            : SizedBox(width: 4);
      }),
    ),
  );
}

/// 좌석 위젯
Widget seat([int? idx]) {
  return Container(
    alignment: Alignment.center,
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: idx == null ? Colors.grey[300]! : null,
    ),
    child: idx == null ? null : Text('$idx'),
  );
}
