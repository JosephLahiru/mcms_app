import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:mcms_app/components/animated_bar.dart';
import 'package:mcms_app/modal/rive_asset.dart';
import 'package:mcms_app/screens/dashboard.dart';
import 'package:mcms_app/screens/reports_daily.dart';
import 'package:mcms_app/screens/reports_monthly.dart';
import 'package:mcms_app/screens/reports_weekly.dart';
import 'package:mcms_app/util/rive_utils.dart';
import 'package:rive/rive.dart';
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mcms_app/util/dateutil.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports>{
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
                //header
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
                      FontAwesomeIcons.book, color: color.AppColors.grey, size: 30.0,),
                    SizedBox(width: 15.0),
                    Icon(
                      Icons.arrow_forward_ios, color: color.AppColors.grey, size: 30.0,),
                  ],
                ),
                SizedBox(height: 30),
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
                            "${DateFormat.d().format(DateTime.now())}${DateUtil.getOrdinalSuffix(DateTime.now().day)} ${DateFormat.MMM().format(DateTime.now())} ${DateTime.now().year}",
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
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.arrowUpRightFromSquare,
                                    color: color.AppColors.nonary,
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
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Reports_Daily()),
                    );
                  },
                ),
                SizedBox(height: 30),
                //view daily report
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: flutter_gradient.LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          color.AppColors.gradientpurplefirst.withOpacity(0.8),
                          color.AppColors.gradientpurplesecond.withOpacity(0.9),
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
                          color: color.AppColors.gradientpurplesecond.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(5, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0 , bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.fileContract,
                                    color: color.AppColors.secondary,
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "View Daily Report",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: color.AppColors.nonary,
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
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Reports_Daily()),
                    );
                  },
                ),
                SizedBox(height: 30),
                //view weekly report
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: flutter_gradient.LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          color.AppColors.gradientpurplefirst.withOpacity(0.8),
                          color.AppColors.gradientpurplesecond.withOpacity(0.9),
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
                          color: color.AppColors.gradientpurplesecond.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(5, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0 , bottom: 20.0),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.fileContract,
                                    color: color.AppColors.tertiary,
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "View Weekly Report",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: color.AppColors.nonary,
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
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Reports_Weekly()),
                    );
                  },
                ),
                SizedBox(height: 30),
                //view monthly report
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: flutter_gradient.LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          color.AppColors.gradientpurplefirst.withOpacity(0.8),
                          color.AppColors.gradientpurplesecond.withOpacity(0.9),
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
                          color: color.AppColors.gradientpurplesecond.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(5, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0 , bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.fileContract,
                                    color: color.AppColors.octonary,
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "View Monthly Report",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: color.AppColors.nonary,
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
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Reports_Monthly()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      // bottomNavigationBar: SafeArea(
      //   child: Container(
      //     padding: const EdgeInsets.all(12),
      //     margin: const EdgeInsets.symmetric(horizontal: 24),
      //     decoration: BoxDecoration(
      //       color: color.AppColors.backgroundColor2.withOpacity(0.8),
      //       borderRadius: const BorderRadius.all(Radius.circular(24)),
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         ...List.generate(
      //           bottomNavs.length,
      //               (index) => GestureDetector(
      //             onTap: () {
      //               bottomNavs[index].input?.change(true);
      //               if (bottomNavs[index] != selectedBottomNav) {
      //                 setState(() {
      //                   selectedBottomNav = bottomNavs[index];
      //                 });
      //               }
      //               Future.delayed(const Duration(seconds: 1), () {
      //                 bottomNavs[index].input!.change(false);
      //               });
      //             },
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 AnimatedBar(
      //                     isActive: bottomNavs[index] == selectedBottomNav),
      //                 SizedBox(
      //                   height: 36,
      //                   width: 36,
      //                   child: Opacity(
      //                     opacity:
      //                     bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
      //                     child: RiveAnimation.asset(
      //                       bottomNavs.first.src,
      //                       artboard: bottomNavs[index].artboard,
      //                       onInit: (artboard) {
      //                         StateMachineController controller =
      //                         RiveUtils.getRiveController(artboard,
      //                             stateMachineName:
      //                             bottomNavs[index].stateMachineName);
      //
      //                         bottomNavs[index].input =
      //                         controller.findSMI("active") as SMIBool;
      //                       },
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

}
