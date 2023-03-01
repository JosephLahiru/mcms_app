import 'package:flutter/material.dart';
import 'package:mcms_app/screens/dashboard.dart';

String splashImg = "assets/images/heart.png";
String splashCompLogo = "assets/images/logo.jpeg";

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
    await Future.delayed(const Duration(milliseconds: 1500), () {});
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
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.only(top: 200.0, bottom: 30.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(splashImg),
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Text(
                    "Medical Center Management System",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage(splashCompLogo),
                  //   ),
                  // ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2.0),
                    image: DecorationImage(
                      image: AssetImage(splashCompLogo),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 15.0,
                  ),
                  child: Text(
                    "Created By Metatron",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
