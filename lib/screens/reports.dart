import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/screens/inventory_details.dart';
import 'package:mcms_app/screens/notifications.dart';
import 'package:mcms_app/screens/reports_daily.dart';
import 'package:mcms_app/screens/reports_monthly.dart';
import 'package:mcms_app/screens/reports_weekly.dart';
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mcms_app/screens/view_report.dart';
import 'package:mcms_app/util/dateutil.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColorHeading =
        colorScheme.brightness == Brightness.dark ? Colors.white : Colors.black;
    final textColorBody =
        colorScheme.brightness == Brightness.dark ? Colors.white : Colors.white;
    final containerColor1 = colorScheme.brightness == Brightness.dark ? color.AppColors.gradientblackfifth : color.AppColors.gradientpurplefirst;
    final containerColor2 = colorScheme.brightness == Brightness.dark ? color.AppColors.gradientblackeighth : color.AppColors.gradientpurplesecond;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
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
                    "Revenue Reports",
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
              SizedBox(height: 50),
              //new report section
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
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
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(80.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: color.AppColors.black
                            .withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(5, 10), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 20.0, right: 20.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Daily Revenue Report",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: textColorBody,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "${DateFormat.d().format(DateTime.now())}${DateUtil.getOrdinalSuffix(DateTime.now().day)} ${DateFormat.MMM().format(DateTime.now())} ${DateTime.now().year}",
                          style: TextStyle(
                            fontSize: 38.0,
                            color: textColorBody,
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "View Report",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: textColorBody,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Icon(
                                  FontAwesomeIcons.arrowUpRightFromSquare,
                                  color: textColorBody,
                                  size: 15.0,
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: containerColor1
                                        .withOpacity(0.8),
                                    blurRadius: 10,
                                    offset: Offset(
                                        4, 8), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.play_circle_fill_outlined,
                                color: color.AppColors.white,
                                size: 50.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          View_Report(selectedDate: DateTime.now()),
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
              // Veiw daily repots
              _buildOptionTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Reports_Daily()),
                  );
                },
                icon: FontAwesomeIcons.fileContract,
                size: 60.0,
                title: "View Daily Revenue\nReport",
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
                    MaterialPageRoute(builder: (context) => Reports_Weekly()),
                  );
                },
                icon: FontAwesomeIcons.fileContract,
                size: 60.0,
                title: "View Weekly Revenue\nReport",
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
                    MaterialPageRoute(builder: (context) => Reports_Monthly()),
                  );
                },
                icon: FontAwesomeIcons.fileContract,
                size: 60.0,
                title: "View Monthly Revenue\nReport",
                containerColor1: containerColor1,
                containerColor2: containerColor2,
                textColorBody: textColorBody,
              ),
              SizedBox(height: 40),
            ],
          ),
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
