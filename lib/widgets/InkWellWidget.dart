import 'package:flutter/material.dart';
import 'package:mcms_app/assets/color.dart' as color;
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class InkWellWidget extends StatelessWidget {
  final Widget screen;
  int not_id;
  String title, subtitle, seen;
  IconData leadingIcon, trailingIcon;
  Color listTileColor, iconColor, listTileBorderColor;

  InkWellWidget({
    super.key,
    required this.not_id,
    required this.title,
    required this.subtitle,
    required this.seen,
    this.leadingIcon = FontAwesomeIcons.prescriptionBottleMedical,
    this.trailingIcon = Icons.forward,
    this.listTileColor = Colors.lightGreenAccent,
    this.iconColor = Colors.lightBlue,
    this.listTileBorderColor = Colors.green,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    if (title == "expiresoon") {
      leadingIcon = FontAwesomeIcons.hourglassHalf;
    } else if (title == "stock") {
      leadingIcon = FontAwesomeIcons.cubes;
    } else if (title == "expired") {
      leadingIcon = FontAwesomeIcons.hourglassEnd;
    } else {
      leadingIcon = FontAwesomeIcons.circleQuestion;
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
    final height = words.length > 6 ? 130.0 : 120.0;

    return InkWell(
      onTap: () async {
        await markNotificationAsSeen(not_id);
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(
                color: seen == "0" ? Colors.blue : Colors.transparent,
                width: 3),
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
                        SizedBox(width: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (words.length > 0)
                              Text(
                                words
                                    .sublist(0, min(2, words.length))
                                    .join(' '),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: textColorBody,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (words.length > 2)
                              Text(
                                words
                                    .sublist(2, min(4, words.length))
                                    .join(' '),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: textColorBody,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            // if (words.length > 4)
                            //   Text(
                            //     words
                            //         .sublist(4, min(6, words.length))
                            //         .join(' '),
                            //     style: TextStyle(
                            //       fontSize: 20.0,
                            //       color: textColorBody,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            if (words.length > 4)
                              Text(
                                words.sublist(4).join(' '),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: textColorBody,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(width: 15),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> markNotificationAsSeen(int id) async {
    const url = 'http://158.101.10.103/update_seen_status';
    final response =
        await http.post(Uri.parse(url), body: {'not_id': id.toString()});

    if (response.statusCode != 200) {
      throw Exception('Failed to mark notification as seen');
    }
  }
}
