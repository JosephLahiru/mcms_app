import 'package:flutter/material.dart';

import '../screens/reports.dart';

class ListWidget extends StatelessWidget {
  final Widget screen;
  String title, subtitle;
  IconData leadingIcon, trailingIcon;
  Color listTileColor, iconColor, listTileBorderColor;

  ListWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      this.leadingIcon = Icons.label,
      this.trailingIcon = Icons.forward,
      this.listTileColor = Colors.lightGreenAccent,
      this.iconColor = Colors.lightBlue,
      this.listTileBorderColor = Colors.green,
      required this.screen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 12.0, right: 12.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return screen;
              },
            ),
          );
        },
        tileColor: listTileColor,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            width: 1.0,
            color: listTileBorderColor,
          ),
        ),
        leading: CircleAvatar(
          child: Icon(leadingIcon),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: CircleAvatar(
          child: Icon(trailingIcon),
        ),
      ),
    );
  }
}
