import 'package:flutter/material.dart';
import 'package:truco_nato/match_detail.dart';

class CustomListItem extends StatelessWidget {
  final String title;
  final String content;
  final String oponente;
  final String duracao;
  final String data;
  final String imagePath;

  CustomListItem(
      {required this.title,
      required this.content,
      required this.imagePath,
      required this.oponente,
      required this.duracao,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to a new screen when the item is tapped
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MatchDetail(
              title: title,
              resultado: content,
              oponente: oponente,
              data: data,
              duracao: duracao,
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
              height: 100.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: Text(
                      content,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
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
    // Create a list of data for your items, each with its own title, content, and image path
    List<Map<String, String>> itemList = [
      {
        'title': "Vitória",
        'content': "12 x 1",
        'imagePath': 'assets/images/win.jpg',
        'oponente': "Luisinho",
        'duracao': "12:00:00",
        'data': "05/09/2023"
      },
      {
        'title': "Vitória",
        'content': "12 x 9",
        'imagePath': 'assets/images/win.jpg',
        'oponente': "Renato3039",
        'duracao': "12:00:00",
        'data': "05/09/2023"
      },
      {
        'title': "Derrota",
        'content': "9 x 12",
        'imagePath': 'assets/images/lose.jpeg',
        'oponente': "Sofia",
        'duracao': "12:00:00",
        'data': "05/09/2023"
      },
      {
        'title': "Vitória",
        'content': "12 x 1",
        'imagePath': 'assets/images/win.jpg',
        'oponente': "Luisinho",
        'duracao': "12:00:00",
        'data': "05/09/2023"
      },
      {
        'title': "Derrota",
        'content': "6 x 12",
        'imagePath': 'assets/images/lose.jpeg',
        'oponente': "Luisinho",
        'duracao': "12:00:00",
        'data': "05/09/2023"
      },
      {
        'title': "Derrota",
        'content': "9 x 12",
        'imagePath': 'assets/images/lose.jpeg',
        'oponente': "Luisinho",
        'duracao': "12:00:00",
        'data': "05/09/2023"
      },
      {
        'title': "Derrota",
        'content': "1 x 12",
        'imagePath': 'assets/images/lose.jpeg',
        'oponente': "Luisinho",
        'duracao': "12:00:00",
        'data': "05/09/2023"
      },
      {
        'title': "Vitória",
        'content': "12 x 6",
        'imagePath': 'assets/images/win.jpg',
        'oponente': "Luisinho",
        'duracao': "12:00:00",
        'data': "05/09/2023"
      },
      {
        'title': "Vitória",
        'content': "12 x 9",
        'imagePath': 'assets/images/win.jpg',
        'oponente': "Luisinho",
        'duracao': "12:00:00",
        'data': "05/09/2023"
      },
      {
        'title': "Vitória",
        'content': "12 x 6",
        'imagePath': 'assets/images/win.jpg',
        'oponente': "Ciclano",
        'duracao': "12:00:00",
        'data': "05/09/2023"
      },
      // Add more items as needed
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: itemList.length, // Use the length of your data list
        itemBuilder: (BuildContext context, int index) {
          // Get the data for the current item
          Map<String, String> itemData = itemList[index];

          // Create the CustomListItem using the data
          return CustomListItem(
            title: itemData['title'] ?? '',
            content: itemData['content'] ?? '',
            imagePath: itemData['imagePath'] ?? '',
            oponente: itemData['oponente'] ?? '',
            duracao: itemData['duracao'] ?? '',
            data: itemData['data'] ?? '',
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: Icon(Icons.interests_rounded), // Replace with your desired icon
        backgroundColor:
            Colors.black, // Customize the button's background color
      ),
    );
  }
}
