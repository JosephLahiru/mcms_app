import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reports"),
      ),
      body: const Center(
        child: Text("Reports"),
      ),
    );
  }
}
