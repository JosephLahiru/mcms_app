import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../model/notifi.dart';
import '../widgets/ListWidget.dart';
import '../assets/color.dart' as color;

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Future<List<Notifi>> notifiFuture = getNotifi();

  static Future<List<Notifi>> getNotifi() async {
    const url = 'http://158.101.10.103/get_notification';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    return body.map<Notifi>(Notifi.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<List<Notifi>>(
            future: notifiFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return const CircularProgressIndicator();
              else if (snapshot.hasError) {
                return Text("Got an error: ${snapshot.error}");
              } else if (snapshot.hasData) {
                final notifications = snapshot.data!;

                notifications.sort((a, b) => b.not_id.compareTo(a.not_id));

                return buildNotifi(notifications.take(10).toList());
              } else {
                return const Text('No notifications found');
              }
            },
          ),
        ),
      );

  Widget buildNotifi(List<Notifi> notifications) => Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.asset(
                  'assets/images/notifi.png',
                  height: 200.0,
                  width: 200.0,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return ListWidget(
                    title: notification.category,
                    subtitle: notification.body,
                    screen: const Notifications(),
                    listTileColor: color.AppColors.gradientpurplesecond,
                    listTileBorderColor: color.AppColors.gradientpurplesecond,
                  );
                },
              ),
            ],
          ),
        ),
      );
}
