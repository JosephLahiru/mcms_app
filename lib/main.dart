import 'package:flutter/material.dart';
import 'package:mcms_app/screens/splash.dart';
import 'package:mcms_app/util/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCMS',
      theme: MedAppTheme.lightTheme,
      darkTheme: MedAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
