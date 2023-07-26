import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:mcms_app/screens/appdrawer.dart';
import 'package:mcms_app/screens/view_monthly_report.dart';
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Reports_Monthly extends StatefulWidget {
  const Reports_Monthly({Key? key}) : super(key: key);

  @override
  State<Reports_Monthly> createState() => _Reports_Monthly();
}

class _Reports_Monthly extends State<Reports_Monthly> {

  BoxDecoration _buildGradientBoxDecoration(Color color1, Color color2) {
    return BoxDecoration(
      gradient: flutter_gradient.LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
        colors: [
          color1.withOpacity(0.8),
          color2.withOpacity(0.9),
        ],
      ),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: color2.withOpacity(0.2),
          blurRadius: 40,
          offset: Offset(8, 10),
        ),
      ],
    );
  }

  Widget _buildGradientContainer(Color color1, Color color2, Widget child) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: _buildGradientBoxDecoration(color1, color2),
      child: Align(
        alignment: Alignment.center,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor =
    colorScheme.brightness == Brightness.dark ? Colors.white : Colors.black;
    final containerColor1 = colorScheme.brightness == Brightness.dark
        ? color.AppColors.gradientblackfifth
        : color.AppColors.gradientpurplefirst;
    final containerColor2 = colorScheme.brightness == Brightness.dark
        ? color.AppColors.gradientblackeighth
        : color.AppColors.gradientpurplesecond;
    final textColorBody = color.AppColors.white;
    final Color monthCellBackground =
    colorScheme.brightness == Brightness.dark ? color.AppColors.gradientblackfifth : color.AppColors.purple8;
    final Color indicatorColor =
    colorScheme.brightness == Brightness.dark ? const Color(0xFF5CFFB7) : const Color(0xFF1AC4C7);
    final Color highlightColor =
    colorScheme.brightness == Brightness.dark ? const Color(0xFF5CFFB7) : color.AppColors.amber;
    final Color cellTextColor = color.AppColors.white;
    final Color weekendTextColor = colorScheme.brightness == Brightness.dark ? Color(0xFF5CFFB7) : color.AppColors.orange;
    final Color weekheaderTextColor = colorScheme.brightness == Brightness.dark ? color.AppColors.skyBlue : color.AppColors.salmon;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.bars),
                    color: textColor,

                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Monthly Report",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      // Use ColorScheme to change text color based on system color
                      // Set text color to black by default
                      color: textColor,
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
              SizedBox(height: 30),
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
                          color: Colors.black.withOpacity(0.2),
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
                        image: AssetImage("assets/images/figure7.png"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildGradientContainer(
                containerColor1,
                containerColor2,
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Select a Date To View Past Month Revenue Report",
                    style: TextStyle(fontSize: 20.0, color: textColorBody, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildGradientContainer(
                containerColor1,
                containerColor2,
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SfDateRangePicker(
                    selectionShape: DateRangePickerSelectionShape.rectangle,
                    selectionColor: highlightColor,
                    selectionTextStyle:
                    TextStyle(color: color.AppColors.white, fontSize: 18),
                    minDate: DateTime(2023),
                    maxDate: DateTime(2030),
                    selectionMode: DateRangePickerSelectionMode.single,
                    headerStyle: DateRangePickerHeaderStyle(
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: color.AppColors.white,
                          fontWeight: FontWeight.w700,
                        )),
                    monthCellStyle: DateRangePickerMonthCellStyle(
                        cellDecoration: _MonthCellDecoration(
                            backgroundColor: monthCellBackground,
                            showIndicator: false,
                            indicatorColor: indicatorColor),
                        todayCellDecoration: _MonthCellDecoration(
                            borderColor: highlightColor,
                            backgroundColor: monthCellBackground,
                            showIndicator: false,
                            indicatorColor: indicatorColor),
                        disabledDatesTextStyle: TextStyle(
                          color: colorScheme.brightness == Brightness.dark ? const Color(0xFF666479) : const Color(0xffe2d7fe),
                        ),
                        weekendTextStyle: TextStyle(
                          color: weekendTextColor,
                          fontSize: 18,
                        ),
                        textStyle: TextStyle(color: cellTextColor, fontSize: 18),
                        todayTextStyle: TextStyle(color: highlightColor, fontSize: 18)),
                    yearCellStyle: DateRangePickerYearCellStyle(
                      todayTextStyle: TextStyle(color: highlightColor, fontSize: 18),
                      textStyle: TextStyle(color: cellTextColor, fontSize: 18),
                      disabledDatesTextStyle: TextStyle(
                          color: colorScheme.brightness == Brightness.dark ? const Color(0xFF666479) : const Color(0xffe2d7fe)),
                      leadingDatesTextStyle:
                      TextStyle(color: cellTextColor.withOpacity(0.5), fontSize: 18),
                    ),
                    showNavigationArrow: true,
                    todayHighlightColor: highlightColor,
                    monthViewSettings: DateRangePickerMonthViewSettings(
                      firstDayOfWeek: 1,
                      viewHeaderStyle: DateRangePickerViewHeaderStyle(
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: weekheaderTextColor,
                              fontWeight: FontWeight.w600)),
                    ),
                    onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => View_Monthly_Report(selectedDate: args.value),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}

/// [_MonthCellDecoration] used to customize the month cell
class _MonthCellDecoration extends Decoration {
  const _MonthCellDecoration(
      {this.borderColor,
        this.backgroundColor,
        required this.showIndicator,
        this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MonthCellDecorationPainter(
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        showIndicator: showIndicator,
        indicatorColor: indicatorColor);
  }
}

/// [_MonthCellDecorationPainter] used to paint month cell decoration.
class _MonthCellDecorationPainter extends BoxPainter {
  _MonthCellDecorationPainter(
      {this.borderColor,
        this.backgroundColor,
        required this.showIndicator,
        this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect bounds = offset & configuration.size!;
    _drawDecoration(canvas, bounds);
  }

  void _drawDecoration(Canvas canvas, Rect bounds) {
    final Paint paint = Paint()..color = backgroundColor!;
    canvas.drawRRect(
        RRect.fromRectAndRadius(bounds, const Radius.circular(5)), paint);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    if (borderColor != null) {
      paint.color = borderColor!;
      canvas.drawRRect(
          RRect.fromRectAndRadius(bounds, const Radius.circular(5)), paint);
    }

    if (showIndicator) {
      paint.color = indicatorColor!;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(Offset(bounds.right - 6, bounds.top + 6), 2.5, paint);
    }
  }
}