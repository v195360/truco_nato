import 'package:flutter/material.dart';

 class FriendGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: ListView.builder(
        itemCount: 5, // Replace with the number of items you want to display
        itemBuilder: (BuildContext context, int index) {
          // You can customize each item here
          return ListTile(
            title: Text("amigo"),
          );
        },
      ),

    );
  }
}