import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/seat_row.dart';

class SeatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SeatPageStatus();
}

class _SeatPageStatus extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: SeatRow(),
        ),
      ),
    );
  }
}
