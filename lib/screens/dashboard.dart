import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  List<String> views = ["Notifications", "Inventory Level", "Reports"];
  List<String> viewDetails = ["3 Products about to expire", "Full inventory", "19th Jan 2023 Report Available"];
  List<IconData> icons = [Icons.notifications, Icons.inventory, Icons.document_scanner];

  String drName = "Harsha";
  String drPic = "assets/images/dr.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 6.0),
              image: DecorationImage(image: AssetImage(drPic),),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 30.0),
              child: Text("Welcome Dr. $drName",
                style: const TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: views.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 12.0, right: 12.0),
                child: ListTile(
                  onTap: (){},
                  tileColor: Colors.lightGreenAccent,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      width: 1.0,
                      color: Colors.green,
                    )
                  ),
                  leading: CircleAvatar(child: Icon(icons[index]),),
                  title: Text(views[index]),
                  subtitle: Text(viewDetails[index]),
                  trailing: const CircleAvatar(child: Icon(Icons.forward),),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
