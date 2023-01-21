import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  List<String> views = ["Notifications", "Inventory Level", "Reports"];
  List<String> viewDetails = ["3 Products about to expire", "Full inventory", "19th Jan 2023 Report Available"];
  List<IconData> icons = [Icons.notifications, Icons.inventory, Icons.document_scanner];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image(image: AssetImage("assets/images/person.png"),
          width: 300.0,
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: views.length,
            itemBuilder: (context, index){
              return ListTile(
                onTap: (){},
                tileColor: Colors.green,
                leading: CircleAvatar(child: Icon(icons[index]),),
                title: Text(views[index]),
                subtitle: Text(viewDetails[index]),
                trailing: const CircleAvatar(child: Icon(Icons.forward),),
              );
            },
          ),
        ],
      ),
    );
  }
}
