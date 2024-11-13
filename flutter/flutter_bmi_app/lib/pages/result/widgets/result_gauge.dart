import 'dart:math';

import 'package:flutter/material.dart';

class ResultGauge extends StatelessWidget {
  double bmi;
  ResultGauge(this.bmi);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.square(
          dimension: 250,
          child: CircularProgressIndicator(
            value: 1,
            color: Theme.of(context).dividerColor,
          ),
        ),
        SizedBox.square(
          dimension: 250,
          child: CircularProgressIndicator(
            value: min(bmi / 35, 1),
            color: Theme.of(context).highlightColor,
          ),
        ),
        Text(
          bmi.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
