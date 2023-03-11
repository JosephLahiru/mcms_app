import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:mcms_app/components/animated_bar.dart';
import 'package:mcms_app/model/rive_asset.dart';
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/util/rive_utils.dart';
import 'package:rive/rive.dart';
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:http/http.dart' as http;
import 'dart:convert';

class View_Report extends StatefulWidget {
  final DateTime selectedDate;

  const View_Report({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<View_Report> createState() => _View_Report();
}

class _View_Report extends State<View_Report> {
  RiveAsset selectedBottomNav = bottomNavs.first;
  late Future<List<dynamic>> futureEarnings;

  @override
  void initState() {
    super.initState();
    futureEarnings = _fetchEarnings();
  }

  Future<List<dynamic>> _fetchEarnings() async {
    final response = await http.get(Uri.parse(
        'http://158.101.10.103/get_earnings/${widget.selectedDate.toString().substring(0, 10)}'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load earnings');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor =
        colorScheme.brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
          child: Column(
            children: [
              //header
              Row(
                children: [
                  Text(
                    "${widget.selectedDate.toString().substring(0, 10)} Report",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      // Use ColorScheme to change text color based on system color
                      // Set text color to black by default
                      color: textColor,
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_back_ios,
                    color: color.AppColors.grey,
                    size: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Icon(
                    Icons.attach_money_outlined,
                    color: color.AppColors.grey,
                    size: 30.0,
                  ),
                  SizedBox(width: 15.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: color.AppColors.grey,
                    size: 30.0,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  gradient: flutter_gradient.LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      color.AppColors.gradientpurplefirst.withOpacity(0.8),
                      color.AppColors.gradientpurplesecond.withOpacity(0.9),
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
                          color.AppColors.gradientpurplesecond.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(5, 10), // changes position of shadow
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date: "),
                                Text(snapshot.data![0]["date"]
                                    .toString()
                                    .substring(0, 10)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Free Amount: "),
                                Text(snapshot.data![0]["free_amt"].toString()),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Actual Cost Free: "),
                                Text(snapshot.data![0]["ac_cost_free"]
                                    .toString()),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Paid Amount: "),
                                Text(snapshot.data![0]["paid_amt"].toString()),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Actual Cost Paid: "),
                                Text(snapshot.data![0]["ac_cost_paid"]
                                    .toString()),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Profit: "),
                                Text(snapshot.data![0]["profit"].toString()),
                              ],
                            ),
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
              SizedBox(height: 30),
              Text('Selected Date: ${widget.selectedDate}'),
            ],
          ),
        ),
      ),
    );
  }
}
