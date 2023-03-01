import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:mcms_app/components/animated_bar.dart';
import 'package:mcms_app/modal/rive_asset.dart';
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/util/rive_utils.dart';
import 'package:rive/rive.dart';
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;

class Reports_Weekly extends StatefulWidget {
  const Reports_Weekly({Key? key}) : super(key: key);

  @override
  State<Reports_Weekly> createState() => _Reports_Weekly();
}

class _Reports_Weekly extends State<Reports_Weekly>{
  RiveAsset selectedBottomNav = bottomNavs.first;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
          child: Column(
            children: [
              Row (
                children: [
                  Text(
                    "Weekly Reports",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      // Use ColorScheme to change text color based on system color
                      // Set text color to black by default
                      color: textColor,
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_back_ios, color: color.AppColors.grey, size: 30.0,),
                  SizedBox(width: 10.0),
                  Icon(
                    Icons.attach_money_outlined, color: color.AppColors.grey, size: 30.0,),
                  SizedBox(width: 15.0),
                  Icon(
                    Icons.arrow_forward_ios, color: color.AppColors.grey, size: 30.0,),
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                  gradient: flutter_gradient.LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                    colors: [
                      color.AppColors.gradientpurplefirst.withOpacity(0.8),
                      color.AppColors.gradientpurplesecond.withOpacity(0.9),
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
                      color: color.AppColors.gradientpurplesecond.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(5, 10), // changes position of shadow
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: flutter_gradient.LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
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
                      color: color.AppColors.gradientpurplesecond.withOpacity(0.2),
                      blurRadius: 40,
                      offset: Offset(8, 10),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0 , bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Select Date To View Report",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: color.AppColors.septenary,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      CalendarDatePicker(
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2030),
                        onDateChanged: (date) {
                          print(date);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
