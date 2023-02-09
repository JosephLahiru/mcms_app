import 'package:flutter/material.dart';
import 'package:mcms_app/screens/dashboard.dart';

String splashImg = "assets/images/heart.png";

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Dashboard();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 250,
              width: 250,
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.only(top: 250.0, bottom: 20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(splashImg),
                ),
              ),
            ),
            Text(
              "Medical Center Management System",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
