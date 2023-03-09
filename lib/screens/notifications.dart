import 'package:flutter/material.dart';
import '../model/notifi.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Notifi> notifications = getNotifi();

  static List<Notifi> getNotifi() {
    const data = [
      {"body": "Yo Was-sup?"},
      {"body": "How Are you?"},
    ];

    return data.map<Notifi>(Notifi.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          centerTitle: true,
        ),
        body: Center(
          child: buildNotifi(notifications),
        ),
      );

  Widget buildNotifi(List<Notifi> notification) => ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text(notification.body),
            ),
          );
        },
      );
}
