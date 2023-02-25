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
                height: 200,
              ),
            ],
          ),
        )
    );
  }
}
