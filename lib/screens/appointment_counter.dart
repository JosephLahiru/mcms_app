import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mcms_app/assets/color.dart' as color;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/screens/inventory_details.dart';
import 'package:mcms_app/screens/reports.dart';

import 'notifications.dart';

void main() {
  runApp(MaterialApp(home: AppointmentCounter()));
}

class AppointmentCounter extends StatefulWidget {
  @override
  _AppointmentCounterState createState() => _AppointmentCounterState();
}

class _AppointmentCounterState extends State<AppointmentCounter> {
  int _appNum = 0;
  Timer? _timer;

  Future<int> getAppNum(String endPoint) async {
    var resp = await http.get(Uri.parse(endPoint));
    if (resp != null && resp.statusCode == 200) {
      List<dynamic> responseJson = jsonDecode(resp.body);
      if (responseJson.isNotEmpty) {
        return responseJson[0]['val'];
      } else {
        throw Exception('Empty response');
      }
    } else {
      throw Exception('Failed to load app number');
    }
  }

  Future<void> setAppNum(String endPoint) async {
    var resp = await http.post(Uri.parse(endPoint));
    if (resp == null || resp.statusCode != 200) {
      throw Exception('Failed to set app number');
    }
  }

  void _getAppNum() async {
    final num = await getAppNum('https://mcms_api.mtron.me/get_app_no');
    setState(() {
      _appNum = num;
    });
  }

  void _setAppNum(int num) async {
    if (num >= 0 && num <= 99) {
      await setAppNum('https://mcms_api.mtron.me/set_app_no/$num');
      _getAppNum();
    } else {
      print('Appointment number must be within 0 and 99');
    }
  }

  @override
  void initState() {
    super.initState();
    _getAppNum();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) => _getAppNum());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
        child: Column(children: [
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
                "Counter",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: color.AppColors.grey,
                  size: 30.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Appointment\nCounter',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              Text(
                '$_appNum',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 280, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 60),
              Container(
                // color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.anglesLeft, size: 80),
                        onPressed:
                            _appNum > 0 ? () => _setAppNum(_appNum - 1) : null,
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.arrowsRotate, size: 80),
                        onPressed: () => _setAppNum(0),
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.anglesRight, size: 80),
                        onPressed:
                            _appNum < 99 ? () => _setAppNum(_appNum + 1) : null,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
