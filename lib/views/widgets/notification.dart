import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.notifications, color: Colors.white),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: "1",
          child: ListTile(
            leading: Icon(Icons.message, color: Colors.blue),
            title: Text("ansoline drug"),
            subtitle: Text("Its 8 PM you have to take the drug."),
          ),
        ),
        const PopupMenuItem(
          value: "2",
          child: ListTile(
            leading: Icon(Icons.message, color: Colors.green),
            title: Text("Painkiller drug"),
            subtitle: Text("Its 7 PM you have to take the drug."),
          ),
        ),
      ],
      onSelected: (value) {
        // Handle notification click
        if (value == "1") {
          print("Demo Notification 1 clicked");
        } else if (value == "2") {
          print("Demo Notification 2 clicked");
        }
      },
    );
  }
}