import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/screens/notifications.dart';
import 'package:mcms_app/screens/reports.dart';
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'notifications_new.dart';

class NotificationDetails extends StatefulWidget {
  String title, body, description;

  NotificationDetails({
    Key? key,
    required this.title,
    required this.body,
    this.description = "N/A",
  }) : super(key: key);

  @override
  _NotificationDetailsState createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textColorHeading =
    colorScheme.brightness == Brightness.dark ? Colors.white : Colors.black;
    final textColorBody =
    colorScheme.brightness == Brightness.dark ? Colors.white : Colors.white;
    final containerColor1 = colorScheme.brightness == Brightness.dark
        ? color.AppColors.gradientblackfifth
        : color.AppColors.gradientpurplefirst;
    final containerColor2 = colorScheme.brightness == Brightness.dark
        ? color.AppColors.gradientblackeighth
        : color.AppColors.gradientpurplesecond;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: Drawer(
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
              leading: Icon(Icons.inventory),
              title: Text("Inventory"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsNew()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.document_scanner),
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
      ),
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.bars),
                  color: textColorHeading,
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
                SizedBox(width: 10.0),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    // Use ColorScheme to change text color based on system color
                    // Set text color to black by default
                    color: textColorHeading,
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: color.AppColors.grey,
                    size: 30.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100.0),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: flutter_gradient.LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight,
                      colors: [
                        containerColor1.withOpacity(0.8),
                        containerColor2.withOpacity(0.9),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(120.0),
                      topRight: Radius.circular(120.0),
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: color.AppColors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(5, 10), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80.0),
                      topRight: Radius.circular(80.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/figure21.png"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 40.0,
                color: Theme
                    .of(context)
                    .brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 12.0, top: 15.0, right: 12.0),
              child: Text(
                widget.body,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? Colors.cyanAccent
                      : Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                widget.description,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
