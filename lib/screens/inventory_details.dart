import 'package:flutter/material.dart';

class InventoryDetails extends StatelessWidget {
  const InventoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = List.generate(
      10,
          (index) => InventoryData(
        'Item $index',
        'Description $index',
        (index + 1) * 10,
        (index + 1) * 20,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Inventory'),
      ),
      body: Center(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Item')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Quantity')),
            DataColumn(label: Text('Price')),
          ],
          rows: List.generate(
            data.length,
                (index) => DataRow(
              cells: [
                DataCell(Text(data[index].item)),
                DataCell(Text(data[index].description)),
                DataCell(Text(data[index].quantity.toString())),
                DataCell(Text(data[index].price.toString())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InventoryData {
  final String item;
  final String description;
  final int quantity;
  final int price;

  InventoryData(this.item, this.description, this.quantity, this.price);
}
