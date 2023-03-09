import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../model/notifi.dart';

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

                return buildNotifi(notifications);
              } else {
                return const Text('No notifications found');
              }
            },
          ),
        ),
      );

  Widget buildNotifi(List<Notifi> notifications) => ListView.builder(
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
