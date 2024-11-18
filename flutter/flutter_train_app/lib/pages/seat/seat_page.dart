import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const rowCnt = 20;
const List<String> seatHeader = ['A', 'B', ' ', 'C', 'D'];

class SeatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SeatPageStatus();
}

class _SeatPageStatus extends State<SeatPage> {
  int? selectedSeat;
  int? selectedRow;
  String? selectedCol;

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as List<String>;
    String? startStation = arguments[0];
    String? endStation = arguments[1];

    return Scaffold(
      appBar: AppBar(title: Text('좌석 선택')),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
              const SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Text('선택됨'),
                    SizedBox(width: 20),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey[300]!,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Text('선택안됨'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(seatHeader.length, (i) {
                    return Container(
                      margin: EdgeInsets.only(right: 4),
                      alignment: Alignment.bottomCenter,
                      width: 50,
                      height: 50,
                      child: Text(seatHeader[i]),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: rowCnt * seatHeader.length,
                    itemBuilder: (context, idx) {
                      String seatChar = seatHeader[idx % 5];
                      return selectSeat(idx, seatChar);
                    }),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedRow != null && selectedCol != null) {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text('예매 하시겠습니까?'),
                            content: Text('좌석 : $selectedRow-$selectedCol'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text(
                                  '취소',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              CupertinoDialogAction(
                                child: const Text(
                                  '확인',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.purple),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    '예매 하기',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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

  GestureDetector selectSeat(int idx, String seatChar) {
    int rowNum = idx ~/ 5 + 1;
    return GestureDetector(
      onTap: () {
        if (idx % 5 == 2) return;
        setState(() {
          if (selectedSeat != idx) {
            selectedSeat = idx;
            selectedCol = seatChar;
            selectedRow = rowNum;
          } else {
            selectedSeat = null;
            selectedCol = null;
            selectedRow = null;
          }
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: (idx == selectedSeat)
              ? Colors.purple
              : (idx % 5 == 2)
                  ? null
                  : Colors.grey[300]!,
        ),
        child: (idx % 5 == 2) ? Text('$rowNum') : null,
      ),
    );
  }
}
