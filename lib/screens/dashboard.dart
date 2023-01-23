import 'package:flutter/material.dart';
import 'package:mcms_app/screens/reports.dart';

import '../widgets/ListWidget.dart';
import 'inventory_details.dart';
import 'notifications.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

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
        centerTitle: true,
      ),
      body: ListView(
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
                  border: Border.all(color: Colors.green, width: 6.0),
                  image: DecorationImage(
                    image: AssetImage(drPic),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  "Welcome Dr. $drName",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ListWidget(
                title: views[0],
                subtitle: viewDetails[0],
                leadingIcon: icons[0],
                screen: const Notifications(),
              ),
              ListWidget(
                title: views[1],
                subtitle: viewDetails[1],
                leadingIcon: icons[1],
                screen: const InventoryDetails(),
              ),
              ListWidget(
                title: views[2],
                subtitle: viewDetails[2],
                leadingIcon: icons[2],
                screen: const Reports(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
