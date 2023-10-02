import 'package:flutter/material.dart';

 class FriendGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: ListView.builder(
        itemCount: 50, // Replace with the number of items you want to display
        itemBuilder: (BuildContext context, int index) {
          // You can customize each item here
          return ListTile(
            title: Text("amigo"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: Icon(Icons.interests_rounded), // Replace with your desired icon
        backgroundColor: Colors.black, // Customize the button's background color
      ),
    );
  }
}