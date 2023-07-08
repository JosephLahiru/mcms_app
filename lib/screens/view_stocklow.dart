import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/screens/notifications.dart';
import 'package:mcms_app/screens/reports.dart';
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcms_app/screens/view_lowstock_items.dart';

class ViewLowStock extends StatefulWidget {
  const ViewLowStock({Key? key}) : super(key: key);

  @override
  State<ViewLowStock> createState() => _ViewLowStock();
}

class _ViewLowStock extends State<ViewLowStock> {

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
      body: Container(
          padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
          child:Column(
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
                      "Low Stock Items",
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
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                            color.AppColors.black.withOpacity(0.2),
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
                          image: AssetImage("assets/images/figure17.png"),
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
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100.0,
                          decoration: BoxDecoration(
                            gradient: flutter_gradient.LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                containerColor1.withOpacity(0.8),
                                containerColor2.withOpacity(0.9),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset(5, 10), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.suitcaseMedical,
                                          size: 50.0,
                                          color: textColorBody,
                                        ),
                                        SizedBox(width: 30),
                                        Text(
                                          "Essential meds",
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            color: textColorBody,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
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
                            MaterialPageRoute(builder: (context) => ViewLowStockItems(stockType: '1')),
                          );
                        },
                      ),
                      SizedBox(height: 40),
                      //Item Expire Soon
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: flutter_gradient.LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                containerColor1.withOpacity(0.8),
                                containerColor2.withOpacity(0.9),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset(5, 10), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.suitcaseMedical,
                                          size: 50.0,
                                          color: textColorBody,
                                        ),
                                        SizedBox(
                                          width: 30.0,
                                        ),
                                        Text(
                                          "Standard inventory",
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            color: textColorBody,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
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
                            MaterialPageRoute(builder: (context) => ViewLowStockItems(stockType: '2')),
                          );
                        },
                      ),
                      SizedBox(height: 40),
                      //Item Stock Low
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: flutter_gradient.LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                containerColor1.withOpacity(0.8),
                                containerColor2.withOpacity(0.9),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset(5, 10), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.suitcaseMedical,
                                          size: 50.0,
                                          color: textColorBody,
                                        ),
                                        SizedBox(
                                          width: 30.0,
                                        ),
                                        Text(
                                          "Bulk supplies",
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            color: textColorBody,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
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
                            MaterialPageRoute(builder: (context) => ViewLowStockItems(stockType: '3')),
                          );
                        },
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
                  MaterialPageRoute(builder: (context) => ViewLowStock()),
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
}
