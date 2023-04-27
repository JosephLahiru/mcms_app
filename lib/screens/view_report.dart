import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/screens/inventory_details.dart';
import 'package:mcms_app/screens/notifications.dart';
import 'package:mcms_app/screens/reports.dart';

class View_Report extends StatefulWidget {
  final DateTime selectedDate;

  const View_Report({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<View_Report> createState() => _View_Report();
}

class _View_Report extends State<View_Report> {
  late Future<List<dynamic>> futureEarnings;

  @override
  void initState() {
    super.initState();
    futureEarnings = _fetchEarnings();
  }

  Future<List<dynamic>> _fetchEarnings() async {
    final response = await http.get(Uri.parse(
        'http://158.101.10.103/get_profit/${widget.selectedDate.toString().substring(0, 10)}'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load earnings');
    }
  }

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
    final reportHeadingSize = 20.0;
    final reportBodySize = 16.0;

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
                    "Report",
                    style: TextStyle(
                      fontSize: 25.0,
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
                  )
                ],
              ),
              SizedBox(height: 30),
              //image
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
                        image: AssetImage("assets/images/figure8.png"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              //body
              SingleChildScrollView(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 450,
                    decoration: BoxDecoration(
                      gradient: flutter_gradient.LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          containerColor1.withOpacity(0.8),
                          containerColor2.withOpacity(0.9),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
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
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                        child: Center(
                          child: FutureBuilder<List<dynamic>>(
                            future: futureEarnings,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.isEmpty) {
                                  return Center(
                                      child: Text("No data available for selected date"));
                                } else {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Center(
                                                child: Text("Report of The "+snapshot.data![0]["date"].toString().substring(0, 10), style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900, color: textColorBody),)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Date: ", style: TextStyle(fontSize: reportHeadingSize, fontWeight: FontWeight.bold, color: textColorBody),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text(snapshot.data![0]["date"].toString().substring(0, 10), style: TextStyle(fontSize: reportBodySize, fontWeight:FontWeight.bold, color: textColorBody),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Selling Price of Freely Issued\n Medicine: ", style: TextStyle(fontSize: reportHeadingSize, fontWeight: FontWeight.bold, color: textColorBody),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Rs." + snapshot.data![0]["selling_cost_free_med"].toString(), style: TextStyle(fontSize: reportBodySize, fontWeight:FontWeight.bold, color: textColorBody),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Actual Price of Freely Issued\n Medicine: ", style: TextStyle(fontSize: reportHeadingSize, fontWeight: FontWeight.bold, color: textColorBody),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Rs." + snapshot.data![0]["actual_cost_free_med"].toString(), style: TextStyle(fontSize: reportBodySize, fontWeight:FontWeight.bold, color: textColorBody),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Selling Price of Issued\nMedicine:", style: TextStyle(fontSize: reportHeadingSize, fontWeight: FontWeight.bold, color: textColorBody),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Rs." + snapshot.data![0]["selling_cost_issued_med"].toString(), style: TextStyle(fontSize: reportBodySize, fontWeight:FontWeight.bold, color: textColorBody),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Actual Price of Issued\n Medicine:", style: TextStyle(fontSize: reportHeadingSize, fontWeight: FontWeight.bold, color: textColorBody),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Rs." + snapshot.data![0]["actual_cost_issued_med"].toString(), style: TextStyle(fontSize: reportBodySize,fontWeight:FontWeight.bold, color: textColorBody),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Profit of The Day: ", style: TextStyle(fontSize: reportHeadingSize, fontWeight: FontWeight.bold, color: textColorBody),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Rs." + snapshot.data![0]["daily_profit"].toString(), style: TextStyle(fontSize: reportBodySize, fontWeight:FontWeight.bold, color: textColorBody),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),
                                    ],
                                  );
                                }
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                        ),
                      ),
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
}
