import 'package:flutter/material.dart';

class InventoryDetails extends StatelessWidget {
  const InventoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Inventory Details"),
      ),
      body: const Center(
        child: Text("Inventory Details"),
      ),
    );
  }
}
