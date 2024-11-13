import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/pages/result/widgets/result_gauge.dart';
import 'package:flutter_bmi_app/pages/result/widgets/result_text.dart';

class ResultPage extends StatelessWidget {
  double bmi;
  ResultPage(this.bmi);

  @override
  Widget build(BuildContext context) {
    final bmi2 = ModalRoute.of(context)?.settings.arguments; // argument로 받는 방법

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Spacer(),
            ResultGauge(bmi),
            SizedBox(height: 50),
            ResultText(bmi),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('RECALCULATE'),
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
