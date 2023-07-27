import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/screens/inventory_details.dart';
import 'package:mcms_app/screens/notifications.dart';
import 'package:mcms_app/screens/reports.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:http/http.dart' as http;

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Map<String, dynamic> _adminDetails = {};

  @override
  void initState() {
    super.initState();
    fetchData().then((adminDetails) {
      setState(() {
        _adminDetails = adminDetails[0];
      });
    }).catchError((error) {
      print('Error fetching admin details: $error');
    });
  }

  Future<List<dynamic>> fetchData() async {
    final response = await http.post(
      Uri.parse('http://158.101.10.103/request_token/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"username": "admin", "password": "adminpwd@1234!"}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch data');
    }

    final token = jsonDecode(response.body)['token'];

    final adminDetailsResponse = await http.get(
      Uri.parse('http://158.101.10.103/get_admin_details'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (adminDetailsResponse.statusCode != 200) {
      throw Exception('Failed to fetch admin details');
    }

    final adminDetails = jsonDecode(adminDetailsResponse.body);

    return adminDetails;
  }

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
            accountName: Text('Dr. ' + (_adminDetails['first_name'] ?? 'N/A')),
            accountEmail: Text(_adminDetails['email'] ?? 'N/A'),
            currentAccountPicture: CircleAvatar(
              foregroundImage: NetworkImage(_adminDetails['profilepicture'] ??
                  'https://drive.google.com/uc?id=1rNJqlaknJv26FuhcbD4o4R4h4DDghTeT'),
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
