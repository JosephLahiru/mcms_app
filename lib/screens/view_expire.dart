import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/screens/notifications.dart';
import 'package:mcms_app/screens/reports.dart';
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcms_app/screens/view_expire_items.dart';
import 'package:mcms_app/screens/inventory_details.dart';

class ViewExpire extends StatefulWidget {
  const ViewExpire({Key? key}) : super(key: key);

  @override
  State<ViewExpire> createState() => _ViewExpire();
}

class _ViewExpire extends State<ViewExpire> {

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColorHeading = colorScheme.brightness == Brightness.dark ? Colors.white : Colors.black;
    final textColorBody = Colors.white;
    final containerColor1 = colorScheme.brightness == Brightness.dark ? color.AppColors.gradientblackfifth : color.AppColors.gradientpurplefirst;
    final containerColor2 = colorScheme.brightness == Brightness.dark ? color.AppColors.gradientblackeighth : color.AppColors.gradientpurplesecond;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
        child: Column(
          children: [
            //header
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
                  "Expire soon",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
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
            SizedBox(height: 50),
            //Image Section
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
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: color.AppColors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(5, 10),
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
                      image: AssetImage("assets/images/figure18.png"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    //Total Items Section
                    _buildOptionTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewExpireItems(expireType: '1')),
                        );
                      },
                      icon: FontAwesomeIcons.box,
                      size: 60.0,
                      title: "Short lifespan items",
                      containerColor1: containerColor1,
                      containerColor2: containerColor2,
                      textColorBody: textColorBody,
                    ),
                    SizedBox(height: 40),
                    //Item Expire Soon
                    _buildOptionTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewExpireItems(expireType: '2')),
                        );
                      },
                      icon: FontAwesomeIcons.box,
                      size: 60.0,
                      title: "Medium lifespan items",
                      containerColor1: containerColor1,
                      containerColor2: containerColor2,
                      textColorBody: textColorBody,
                    ),
                    SizedBox(height: 40),
                    //Stock Low
                    _buildOptionTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewExpireItems(expireType: '3')),
                        );
                      },
                      icon: FontAwesomeIcons.box,
                      size: 60.0,
                      title: "Long lifespan items",
                      containerColor1: containerColor1,
                      containerColor2: containerColor2,
                      textColorBody: textColorBody,
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
                  MaterialPageRoute(builder: (context) => InventoryDetails()),
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
    );
  }

  Widget _buildOptionTile({
    required Function onTap,
    required IconData icon,
    required double size,
    required String title,
    required Color containerColor1,
    required Color containerColor2,
    required Color textColorBody,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
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
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: color.AppColors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(5, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: size,
              color: textColorBody,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: textColorBody,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
