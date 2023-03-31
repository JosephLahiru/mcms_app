import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final Widget screen;
  String title, subtitle;
  IconData leadingIcon, trailingIcon;
  Color listTileColor, iconColor, listTileBorderColor;

  ListWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.leadingIcon = Icons.label,
    this.trailingIcon = Icons.forward,
    this.listTileColor = Colors.lightGreenAccent,
    this.iconColor = Colors.lightBlue,
    this.listTileBorderColor = Colors.green,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    if (title == "Medicine") {
      leadingIcon = Icons.medical_information;
    }

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
        title: Text(
          title,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        subtitle:
            Text(subtitle, style: Theme.of(context).textTheme.titleMedium),
        trailing: CircleAvatar(
          child: Icon(trailingIcon),
        ),
      ),
    );
  }
}
