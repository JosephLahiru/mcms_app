import 'package:flutter/material.dart';
import 'package:mcms_app/screens/appointment_counter.dart';
import 'package:mcms_app/widgets/appdrawer.dart';
import 'package:mcms_app/screens/reports.dart';
import 'package:http/http.dart' as http;
import 'inventory_details.dart';
import 'notifications.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  List<Widget> screens = [
    Notifications(),
    InventoryDetails(),
    Reports(),
    AppointmentCounter()
  ];
  List<String> views = ["Notifications", "Inventory", "Reports", "Counter"];
  List<String> images = [
    "notification.png",
    "Inventory.png",
    "report.png",
    "counter.png"
  ];
  String drName = "Nilantha";
  String drPic = "assets/images/dr.png";

  Future<int> getUnseenNotificationsCount() async {
    final response =
        await http.get(Uri.parse('http://158.101.10.103/get_seen_count'));

    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw Exception('Failed to load unseen notifications count');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(120),
            bottomRight: Radius.circular(380),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(230),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    " Welcome\nDr. ${drName}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(drPic),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 20)),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: screens.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return screens[index];
                        },
                      ),
                    );
                  },
                  child: Card(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 6,
                    child: Stack(
                      children: [
                        Center(
                          // Center the Column
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/${images[index]}",
                                height: 128.0,
                                width: 128.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  views[index],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (index == 0)
                          FutureBuilder<int>(
                            future: getUnseenNotificationsCount(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Icon(Icons.error);
                              } else {
                                return Positioned(
                                  top: 8.0,
                                  right: 8.0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      '${snapshot.data}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
