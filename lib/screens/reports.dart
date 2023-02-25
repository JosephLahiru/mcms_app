import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = List.generate(
      10,
          (index) => ReportData(
        'Report $index',
        'Description $index',
        'Date $index',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reports'),
      ),
      body: Container(
        padding: const EdgeInsets.only(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              //add red color square
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
      )
    );
  }
}

class ReportData {
  final String report;
  final String description;
  final String date;

  ReportData(this.report, this.description, this.date);
}
