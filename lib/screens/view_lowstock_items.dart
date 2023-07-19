import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/screens/inventory_details.dart';
import 'package:mcms_app/screens/notifications.dart';
import 'package:mcms_app/screens/reports.dart';
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

// Define a function to make the API call and return the data
Future<List<dynamic>> fetchData(String stockType) async {
  final response = await http.get(Uri.parse('http://158.101.10.103/get_stock_low/$stockType'));

  if (response.statusCode != 200) {
    throw Exception('Failed to fetch data');
  }

  return jsonDecode(response.body);
}

class ViewLowStockItems extends StatefulWidget {
  final String stockType;

  const ViewLowStockItems({Key? key, required this.stockType}) : super(key: key);

  @override
  State<ViewLowStockItems> createState() => _ViewLowStockItems();
}

class _ViewLowStockItems extends State<ViewLowStockItems> {
  late Future<List<dynamic>> futureData;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureData = fetchData(widget.stockType);
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
    final importantColor = colorScheme.brightness == Brightness.dark
        ? color.AppColors.gold
        : color.AppColors.gold;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView( // Wrap the Scaffold with SingleChildScrollView
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
                    widget.stockType == '1'
                        ? "Essential meds"
                        : widget.stockType == '2'
                        ? "Standard inventory"
                        : "Bulk supplies",
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
              //search bar for flutter app
              TextField(
                style: TextStyle(color: textColorHeading),
                autofocus: true,
                controller: searchController,
                onChanged: (value) {
                  setState(() {}); // Trigger widget rebuild when search text changes
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 600.0,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder<List<dynamic>>(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    } else {
                      List<dynamic> filteredData = snapshot.data!;

                      if (searchController.text.isNotEmpty) {
                        filteredData = snapshot.data!.where((data) {
                          String productName = data['prdct_name'].toString().toLowerCase();
                          return productName.contains(searchController.text.toLowerCase());
                        }).toList();
                      }

                      if (filteredData.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off_rounded,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Sorry, No results found!",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: color.AppColors.purple20,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return SingleChildScrollView( // Wrap the Column with SingleChildScrollView
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true, // Ensures that the ListView takes only the necessary space
                              physics: NeverScrollableScrollPhysics(), // Disables ListView scrolling
                              itemCount: filteredData.length,
                              itemBuilder: (context, index) {
                                final data = filteredData[index];
                                // rest of your code
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
                                              Text(
                                                'MFD : ${data['mfd_date'].toString().substring(0, 10)}',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: textColorBody,
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Text(
                                                'EXP : ${data['exp_date'].toString().substring(0, 10)}',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
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
                                                      fontSize: 20.0,
                                                      color: importantColor,
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
                            ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
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
}
