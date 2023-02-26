import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
          child: Column(
            children: [
              Row (
                children: [
                  Text(
                    "Reports",
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
                    Icons.calendar_today_outlined, color: color.AppColors.grey, size: 30.0,),
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
                  gradient: LinearGradient(
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
                child: Container(
                  padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0 , bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Report",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: color.AppColors.nonary,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "19th Jan 2023",
                        style: TextStyle(
                          fontSize: 35.0,
                          color: color.AppColors.nonary,
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
                                  color: color.AppColors.nonary,
                                ),
                              ),
                              Icon(
                                Icons.read_more_outlined,
                                color: color.AppColors.nonary,
                                size: 30.0,
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              boxShadow: [
                                BoxShadow(
                                  color: color.AppColors.gradientpurplefirst.withOpacity(0.8),
                                  blurRadius: 10,
                                  offset: Offset(4, 8), // changes position of shadow
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
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: color.AppColors.gradientpurplefirst.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.AppColors.gradientpurplesecond.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(5, 10), // changes position of shadow
                    ),
                  ],
                ),
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2030),
                  onDateChanged: (date) {
                    print(date);
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
