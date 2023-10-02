import 'package:flutter/material.dart';
import 'package:truco_nato/match_detail.dart';

class CustomListItem extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;

  CustomListItem({required this.title, required this.content, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to a new screen when the item is tapped
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MatchDetail(
              title: title,
              content: content,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MatchHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: ListView.builder(
        itemCount: 50, // Replace with the number of items you want to display
        itemBuilder: (BuildContext context, int index) {
          // You can customize each item here
          return CustomListItem(
            title: "Item $index",
            content: "This is the content of Item $index.",
            imagePath: 'assets/images/truconato.jpeg', // Replace with the image path for each item
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

