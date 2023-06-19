import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InkWellWidget extends StatelessWidget {
  final Widget screen;
  String title, subtitle;
  IconData leadingIcon, trailingIcon;
  Color listTileColor, iconColor, listTileBorderColor;

  InkWellWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.leadingIcon = FontAwesomeIcons.prescriptionBottleMedical,
    this.trailingIcon = Icons.forward,
    this.listTileColor = Colors.lightGreenAccent,
    this.iconColor = Colors.lightBlue,
    this.listTileBorderColor = Colors.green,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    if (title == "Expiry") {
      leadingIcon = FontAwesomeIcons.triangleExclamation;
    } else if (title == "Medicine") {
      leadingIcon = FontAwesomeIcons.prescriptionBottle;
    } else if (title == "Stock") {
      leadingIcon = FontAwesomeIcons.box;
    } else {
      leadingIcon = FontAwesomeIcons.clipboardQuestion;
    }

    final colorScheme = Theme.of(context).colorScheme;
    final textColorBody =
        colorScheme.brightness == Brightness.dark ? Colors.white : Colors.white;
    final containerColor1 = colorScheme.brightness == Brightness.dark
        ? color.AppColors.gradientblackfifth
        : color.AppColors.gradientpurplefirst;
    final containerColor2 = colorScheme.brightness == Brightness.dark
        ? color.AppColors.gradientblackeighth
        : color.AppColors.gradientpurplesecond;

    final words = subtitle.split(' ');
    final height = words.length > 6 ? 110.0 : 90.0;

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: BoxDecoration(
            gradient: flutter_gradient.LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                containerColor1.withOpacity(0.8),
                containerColor2.withOpacity(0.9),
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(5, 10), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(
                          leadingIcon,
                          size: 50.0,
                        ),
                        SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (words.length > 0)
                              Text(
                                words.sublist(0, 3).join(' '),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: textColorBody,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (words.length > 3)
                              Text(
                                words.sublist(3, 6).join(' '),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: textColorBody,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (words.length > 6)
                              Text(
                                words.sublist(6).join(' '),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: textColorBody,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
