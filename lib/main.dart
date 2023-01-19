import 'package:flutter/material.dart';
import 'package:mcms_app/screens/Dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCMS',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Dashboard()
    );
  }
}
