import 'package:flutter/material.dart';
import 'package:truco_nato/match_history.dart';
import 'package:truco_nato/profile.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String enteredName = '';
  int redCounter = 0;
  int greenCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFBfa2632),
        title: Text('Nova Partida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  enteredName = value;
                });
              },
              decoration:
                  InputDecoration(labelText: 'Insira o nome do oponente'),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        greenCounter++;
                        checkCounter(greenCounter, 'jogador');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: CircleBorder(),
                      padding:
                          EdgeInsets.all(40.0), // Adjust the size as needed
                    ),
                    child: Text(
                      '$greenCounter',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Você',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                SizedBox(width: 60), // Adjust the spacing between buttons
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          redCounter++;
                          checkCounter(redCounter, 'oponente');
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: CircleBorder(),
                        padding:
                            EdgeInsets.all(40.0), // Adjust the size as needed
                      ),
                      child: Text(
                        '$redCounter',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '$enteredName',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MatchHistory()),
          );
        },
        child: Icon(Icons.close_rounded),
        backgroundColor: Colors.black,
      ),
    );
  }

  void checkCounter(int counter, String jogador) {
    if (counter == 12) {
      showPopup(jogador);
    }
  }

  void showPopup(String jogador) {
    String message = jogador == 'oponente'
        ? 'Seu oponente venceu a partida.'
        : 'Você ganhou a partida';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Partida finalizada'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
