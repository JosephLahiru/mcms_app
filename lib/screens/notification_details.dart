import 'package:flutter/material.dart';

class NotificationDetails extends StatelessWidget {
  String title, body, description;

  NotificationDetails({
    super.key,
    required this.title,
    required this.body,
    this.description = "N/A",
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Notification Details"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.asset(
                  'assets/images/medicine.png',
                  height: 200.0,
                  width: 400.0,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, top: 15.0, right: 12.0),
                child: Text(
                  body,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      );
}
