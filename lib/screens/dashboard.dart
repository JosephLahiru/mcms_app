import 'package:flutter/material.dart';
import 'package:mcms_app/screens/reports.dart';

import '../widgets/ListWidget.dart';
import 'inventory_details.dart';
import 'notifications.dart';

import '../assets/color.dart' as color;

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  List<Widget> screens = [Notifications(), InventoryDetails(), Reports()];
  List<String> views = ["Notifications", "Inventory Level", "Reports"];
  List<String> viewDetails = [
    "3 Products about to expire",
    "Full inventory",
    "19th Jan 2023 Report Available"
  ];
  List<IconData> icons = [
    Icons.notifications,
    Icons.inventory,
    Icons.document_scanner
  ];

  String drName = "Harsha";
  String drPic = "assets/images/dr.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () {},
        //   ),
        // ],
        elevation: 0,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Dr. Harsha"),
              accountEmail: Text("harsha@gmail.com"),
              currentAccountPicture: CircleAvatar(
                foregroundImage: AssetImage(drPic),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.inventory),
              title: Text("Inventory"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.document_scanner),
              title: Text("Reports"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color.AppColors.purple, width: 6.0),
                  image: DecorationImage(
                    image: AssetImage(drPic),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  "Welcome Dr. $drName",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: screens.length,
              itemBuilder: (context, index) {
                return ListWidget(
                  title: views[index],
                  subtitle: viewDetails[index],
                  leadingIcon: icons[index],
                  screen: screens[index],
                  listTileColor: color.AppColors.gradientpurplesecond,
                  listTileBorderColor: color.AppColors.gradientpurplesecond,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
