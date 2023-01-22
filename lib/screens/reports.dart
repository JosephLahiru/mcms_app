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
      body: Center(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Report')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Date')),
          ],
          rows: List.generate(
            data.length,
                (index) => DataRow(
              cells: [
                DataCell(Text(data[index].report)),
                DataCell(Text(data[index].description)),
                DataCell(Text(data[index].date)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReportData {
  final String report;
  final String description;
  final String date;

  ReportData(this.report, this.description, this.date);
}
