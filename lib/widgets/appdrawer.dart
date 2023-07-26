import 'package:flutter/material.dart';
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/screens/inventory_details.dart';
import 'package:mcms_app/screens/notifications.dart';
import 'package:mcms_app/screens/reports.dart';
import 'package:mcms_app/assets/color.dart' as color;

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final containerColor1 = colorScheme.brightness == Brightness.dark
        ? color.AppColors.gradientblackfifth
        : color.AppColors.gradientpurplefirst;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: containerColor1.withOpacity(0.8),
            ),
            accountName: Text("Dr. Harsha"),
            accountEmail: Text("harsha@gmail.com"),
            currentAccountPicture: CircleAvatar(
              foregroundImage: AssetImage('assets/images/dr.png'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Dashboard"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.inventory),
            title: Text("Inventory"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InventoryDetails()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text("Reports"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reports()),
              );
            },
          ),
        ],
      ),
    );
  }
}