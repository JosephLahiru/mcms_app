import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/screens/inventory_details.dart';
import 'package:mcms_app/screens/notifications_new.dart';
import 'package:mcms_app/screens/reports.dart';
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Define a function to make the API call and return the data
Future<List<dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('http://158.101.10.103/get_stock'));

  if (response.statusCode != 200) {
    throw Exception('Failed to fetch data');
  }

  return jsonDecode(response.body);
}

class ViewAllProducts extends StatefulWidget {
  const ViewAllProducts({Key? key}) : super(key: key);

  @override
  State<ViewAllProducts> createState() => _ViewAllProducts();
}

class _ViewAllProducts extends State<ViewAllProducts> {
  late Future<List<dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

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
                  "Inventory Items",
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
            //search bar for flutter app

            SizedBox(height: 20),
            Container(
              height: 600.0,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<List<dynamic>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final data = snapshot.data![index];
                        return Container(
                          child: Column(
                            children: [
                              Container(
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
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: Offset(5, 10),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['prdct_name'],
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color: textColorBody,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        data['brand_name'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: textColorBody,
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Rs.${data['sell_price']}',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: textColorBody,
                                            ),
                                          ),
                                          Text(
                                            'In Stock: ${data['total_quantity']}',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: textColorBody,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0)
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
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
                  MaterialPageRoute(builder: (context) => NotificationsNew()),
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
